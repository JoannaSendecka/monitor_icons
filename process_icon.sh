#!/bin/bash
# Script to process icons using the established methodology
# Usage: ./process_icon.sh <source_url> <icon_name> [target_folder]
# Example: ./process_icon.sh "https://example.com/icon.jpg" "newsletter" "Socialmedia_32x32_svg"

set -e  # Exit on error

# Check arguments
if [ $# -lt 2 ]; then
    echo "Usage: $0 <source_url> <icon_name> [target_folder]"
    echo "Example: $0 'https://example.com/icon.jpg' 'newsletter' 'Socialmedia_32x32_svg'"
    exit 1
fi

SOURCE_URL="$1"
ICON_NAME="$2"
TARGET_FOLDER="${3:-Socialmedia_32x32_svg}"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
TEMP_DIR="/tmp/icon_processing_$$"

# Create temp directory
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR"

echo "Processing icon: $ICON_NAME"
echo "Source URL: $SOURCE_URL"
echo "Target folder: $TARGET_FOLDER"

# Step 1: Download the original icon
echo "Step 1: Downloading original icon..."
curl -L "$SOURCE_URL" -o "${ICON_NAME}_original.jpg" || \
curl -L "$SOURCE_URL" -o "${ICON_NAME}_original.png" || \
curl -L "$SOURCE_URL" -o "${ICON_NAME}_original.svg"

# Determine file type
if [ -f "${ICON_NAME}_original.jpg" ]; then
    ORIGINAL_FILE="${ICON_NAME}_original.jpg"
elif [ -f "${ICON_NAME}_original.png" ]; then
    ORIGINAL_FILE="${ICON_NAME}_original.png"
elif [ -f "${ICON_NAME}_original.svg" ]; then
    ORIGINAL_FILE="${ICON_NAME}_original.svg"
else
    echo "Error: Could not download icon from $SOURCE_URL"
    exit 1
fi

echo "Downloaded: $ORIGINAL_FILE"

# Step 2: Convert to 32x32 PNG
echo "Step 2: Converting to 32x32 PNG..."
magick "$ORIGINAL_FILE" -resize 32x32 -quality 100 "${ICON_NAME}_32x32.png"

# Step 3: Create base64 encoded version
echo "Step 3: Creating base64 encoded version..."
base64 -w 0 "${ICON_NAME}_32x32.png" > "${ICON_NAME}_base64.txt"

# Step 4: Create SVG with embedded image
echo "Step 4: Creating SVG with embedded image..."
BASE64=$(cat "${ICON_NAME}_base64.txt")
cat > "${ICON_NAME}_32x32.svg" << EOF
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" width="32" height="32">
  <image x="0" y="0" width="32" height="32" xlink:href="data:image/png;base64,$BASE64"/>
</svg>
EOF

# Step 5: Copy to repository and commit
echo "Step 5: Copying to repository..."
mkdir -p "$REPO_DIR/$TARGET_FOLDER"
cp "${ICON_NAME}_32x32.svg" "$REPO_DIR/$TARGET_FOLDER/${ICON_NAME}.svg"

# Step 6: Commit and push
echo "Step 6: Committing and pushing to repository..."
cd "$REPO_DIR"
git add "$TARGET_FOLDER/${ICON_NAME}.svg"
git commit -m "Add/update ${ICON_NAME} icon from ${SOURCE_URL}"
git push origin main

# Cleanup
rm -rf "$TEMP_DIR"

echo ""
echo "✓ Successfully processed $ICON_NAME icon!"
echo "  SVG saved to: $REPO_DIR/$TARGET_FOLDER/${ICON_NAME}.svg"
echo "  GitHub URL: https://raw.githubusercontent.com/JoannaSendecka/monitor_icons/main/$TARGET_FOLDER/${ICON_NAME}.svg"

