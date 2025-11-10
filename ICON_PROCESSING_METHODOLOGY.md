# Icon Processing Methodology

This document describes the **exact methodology** for processing icons to ensure consistency, crispness, and compatibility with constrained environments like openAIRE.

## Overview

Icons are processed as **SVG files with embedded 32x32 PNG images** to ensure:
- ✅ No pixelation (vector-based container)
- ✅ Crisp appearance at any size
- ✅ Explicit dimensions prevent CSS overwrites
- ✅ Works in constrained environments
- ✅ Smaller file sizes than pure raster images

## Prerequisites

- ImageMagick (`magick` command) installed
- `curl` for downloading
- `base64` command available
- Git repository access configured
- Repository cloned locally

## Step-by-Step Process

### Method 1: Using the Automated Script (Recommended)

```bash
cd /path/to/monitor_icons_repo
chmod +x process_icon.sh
./process_icon.sh "https://example.com/icon.jpg" "icon_name" "Socialmedia_32x32_svg"
```

**Parameters:**
- `source_url`: URL of the original icon (JPG, PNG, or SVG)
- `icon_name`: Name for the icon file (without extension)
- `target_folder`: Folder in repository (default: `Socialmedia_32x32_svg`)

### Method 2: Manual Process

If you need to process manually or the script doesn't work, follow these exact steps:

#### Step 1: Download Original Icon
```bash
cd /tmp
curl -L "https://example.com/icon.jpg" -o icon_original.jpg
```

#### Step 2: Convert to 32x32 PNG
```bash
magick icon_original.jpg -resize 32x32 -quality 100 icon_32x32.png
```

#### Step 3: Create Base64 Encoded Version
```bash
base64 -w 0 icon_32x32.png > icon_base64.txt
```

#### Step 4: Create SVG with Embedded Image
```bash
BASE64=$(cat icon_base64.txt)
cat > icon_32x32.svg << EOF
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" width="32" height="32">
  <image x="0" y="0" width="32" height="32" xlink:href="data:image/png;base64,$BASE64"/>
</svg>
EOF
```

#### Step 5: Copy to Repository
```bash
cd /path/to/monitor_icons_repo
cp /tmp/icon_32x32.svg Socialmedia_32x32_svg/icon_name.svg
```

#### Step 6: Commit and Push
```bash
git add Socialmedia_32x32_svg/icon_name.svg
git commit -m "Add/update icon_name icon from [source_url]"
git push origin main
```

## Key Requirements

### SVG Structure
The SVG **must** have:
- `xmlns="http://www.w3.org/2000/svg"` and `xmlns:xlink="http://www.w3.org/1999/xlink"` namespaces
- `viewBox="0 0 32 32"` for proper scaling
- **Explicit `width="32" height="32"` attributes** (critical for CSS override prevention)
- Embedded image using base64 data URI

### Image Conversion
- **Size**: Exactly 32x32 pixels
- **Quality**: 100 (maximum)
- **Format**: PNG (best compression for embedded images)

### File Naming
- Use lowercase with underscores: `icon_name.svg`
- No spaces or special characters
- Descriptive names (e.g., `newsletter.svg`, `bluesky.svg`)

## Example: Processing Newsletter Icon

```bash
./process_icon.sh \
  "https://icon-library.com/images/newsletter-icon/newsletter-icon-5.jpg" \
  "newsletter" \
  "Socialmedia_32x32_svg"
```

## Verification

After processing, verify the icon:
1. Check file exists: `ls Socialmedia_32x32_svg/icon_name.svg`
2. Verify SVG structure: `head -3 Socialmedia_32x32_svg/icon_name.svg`
3. Check GitHub URL: `https://raw.githubusercontent.com/JoannaSendecka/monitor_icons/main/Socialmedia_32x32_svg/icon_name.svg`

## Troubleshooting

### ImageMagick not found
```bash
# Install ImageMagick
sudo apt-get install imagemagick  # Debian/Ubuntu
sudo yum install ImageMagick      # RHEL/CentOS
```

### Base64 encoding issues
```bash
# Alternative base64 command
cat icon_32x32.png | base64 | tr -d '\n' > icon_base64.txt
```

### Git push fails
```bash
# Check repository status
git status
# Ensure you're on main branch
git checkout main
```

## Why This Method Works

1. **SVG Container**: Provides vector-based scaling without pixelation
2. **Explicit Dimensions**: `width="32" height="32"` prevents CSS from overriding sizes
3. **Embedded Image**: Base64 data URI ensures the icon loads even in constrained environments
4. **32x32 Size**: Pre-optimized size prevents CSS resizing issues
5. **Repository Storage**: GitHub raw URLs provide reliable, version-controlled access

## References

- Repository: https://github.com/JoannaSendecka/monitor_icons
- Target folder: `Socialmedia_32x32_svg/`
- GitHub raw URL pattern: `https://raw.githubusercontent.com/JoannaSendecka/monitor_icons/main/Socialmedia_32x32_svg/[icon_name].svg`

