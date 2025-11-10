# Monitor Icons

**Storage repository for icons (original and resized) used in the openAIRE Connect instance maintained by SciLifeLab.**

This repository contains standardized icons for various data repositories, social media platforms, and organizations, optimized for use in the openAIRE Monitor interface.

## 📋 Overview

This repository serves as a centralized storage location for:
- **Original icons** - High-resolution source images
- **Resized icons** - Optimized versions in standard sizes (16x16, 20x20, 24x24, 32x32)
- **SVG icons** - Vector-based icons with embedded images for crisp display

All icons are version-controlled and accessible via GitHub raw URLs for reliable integration into the openAIRE Connect environment.

## 🎯 Purpose

Icons stored in this repository are specifically designed for use in:
- **openAIRE Connect** - The openAIRE Monitor instance maintained by SciLifeLab
- **Constrained environments** - Where CSS overrides and asset-serving limitations require explicit sizing and reliable hosting

## 📁 Repository Structure

```
monitor_icons/
├── [RepositoryName]/          # Individual repository folders
│   ├── logo-original.png       # Original high-resolution logo
│   ├── logo-16x16.png          # 16x16 pixel version
│   ├── logo-20x20.png          # 20x20 pixel version
│   └── logo-24x24.png          # 24x24 pixel version
│
├── Socialmedia/                # Social media icons (PNG)
│   └── [platform].png
│
├── Socialmedia_32x32/          # 32x32 social media icons (PNG)
│   └── [platform].png
│
├── Socialmedia_32x32_svg/      # 32x32 social media icons (SVG with embedded images)
│   ├── bluesky.svg
│   ├── facebook.svg
│   ├── instagram.svg
│   ├── linkedin.svg
│   ├── newsletter.svg
│   └── youtube.svg
│
├── SciLifeLab/                 # SciLifeLab branding assets
│   ├── logo-original.png
│   ├── scilifelab.png
│   └── [sized versions]
│
├── process_icon.sh             # Automated icon processing script
├── ICON_PROCESSING_METHODOLOGY.md  # Detailed processing documentation
└── README.md                   # This file
```

## 🚀 Usage

### Accessing Icons via GitHub Raw URLs

All icons can be accessed directly using GitHub raw URLs:

```
https://raw.githubusercontent.com/JoannaSendecka/monitor_icons/main/[folder]/[filename]
```

### Examples

**Social Media Icons (SVG - Recommended):**
```html
<img src="https://raw.githubusercontent.com/JoannaSendecka/monitor_icons/main/Socialmedia_32x32_svg/facebook.svg" 
     alt="Facebook" 
     style="width: 32px; height: 32px;">
```

**Repository Logos:**
```html
<img src="https://raw.githubusercontent.com/JoannaSendecka/monitor_icons/main/biosamples/logo-20x20.png" 
     alt="BioSamples" 
     style="height: 20px; width: 20px;">
```

**SciLifeLab Logo:**
```html
<img src="https://raw.githubusercontent.com/JoannaSendecka/monitor_icons/main/SciLifeLab/scilifelab.png" 
     alt="SciLifeLab Logo" 
     style="height: 24px; width: auto;">
```

## 🛠️ Adding/Updating Icons

### Quick Start: Automated Processing

Use the provided script for consistent icon processing:

```bash
cd /path/to/monitor_icons_repo
chmod +x process_icon.sh
./process_icon.sh "https://example.com/icon.jpg" "icon_name" "Socialmedia_32x32_svg"
```

### Manual Processing

For detailed instructions on processing icons manually, see:
- **[ICON_PROCESSING_METHODOLOGY.md](ICON_PROCESSING_METHODOLOGY.md)** - Complete step-by-step guide

### Key Requirements

When adding new icons:
1. **SVG icons** must have explicit `width="32" height="32"` attributes
2. **PNG icons** should be resized to exact dimensions (16x16, 20x20, 24x24, 32x32)
3. **Original files** should be preserved for future processing
4. **File naming** should use lowercase with underscores (e.g., `icon_name.svg`)

## 📦 Available Icon Sets

### Social Media Icons
- Bluesky
- Facebook
- Instagram
- LinkedIn
- Newsletter
- YouTube

### Data Repositories
The repository contains icons for numerous data repositories including:
- Array Express
- BioSamples
- ENA (European Nucleotide Archive)
- GEO (Gene Expression Omnibus)
- PDB (Protein Data Bank)
- And many more...

See the repository structure for a complete list.

## 🔧 Technical Details

### Icon Formats

**SVG (Recommended for Social Media):**
- Vector-based container with embedded 32x32 PNG
- Prevents pixelation at any size
- Explicit dimensions prevent CSS overwrites
- Ideal for constrained environments

**PNG (Standard Sizes):**
- 16x16, 20x20, 24x24, 32x32 pixels
- Optimized for web use
- Preserves aspect ratio where applicable

### Why This Structure?

1. **Version Control** - All icons are tracked in Git
2. **Reliable Hosting** - GitHub raw URLs provide stable access
3. **Consistency** - Standardized sizes ensure uniform appearance
4. **Optimization** - Pre-sized icons reduce processing overhead
5. **Compatibility** - Works in environments with CSS constraints

## 📚 Documentation

- **[ICON_PROCESSING_METHODOLOGY.md](ICON_PROCESSING_METHODOLOGY.md)** - Complete guide for processing icons
- **[process_icon.sh](process_icon.sh)** - Automated processing script

## 🤝 Contributing

When adding or updating icons:

1. Follow the methodology in `ICON_PROCESSING_METHODOLOGY.md`
2. Use the `process_icon.sh` script when possible
3. Preserve original files for future reference
4. Commit with descriptive messages
5. Test icons in the target environment (openAIRE Connect)

## 📝 License

Icons in this repository are used for the openAIRE Monitor instance maintained by SciLifeLab. Please respect the original copyrights and licenses of individual icons.

## 🔗 Related Resources

- **openAIRE Monitor**: [https://monitor.openaire.eu/](https://monitor.openaire.eu/)
- **SciLifeLab**: [https://www.scilifelab.se/](https://www.scilifelab.se/)
- **Repository**: [https://github.com/JoannaSendecka/monitor_icons](https://github.com/JoannaSendecka/monitor_icons)

## 📧 Contact

For questions or issues related to icons in this repository, please contact the SciLifeLab openAIRE Monitor team.

---

**Maintained by SciLifeLab for the openAIRE Connect instance**

