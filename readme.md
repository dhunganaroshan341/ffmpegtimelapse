# FFmpeg Timelapse Builder

A lightweight command-line utility for creating timelapse videos from DSLR or camera image sequences using FFmpeg.

Designed for photographers, content creators, and Linux users who want a simple workflow for generating high-quality timelapse videos without memorizing complex FFmpeg commands.

---

## Features

* Interactive CLI workflow
* Horizontal and vertical video support
* HD, HD+, and 4K output presets
* Custom FPS selection
* Automatic image sequence detection
* Image count and duration estimation
* Output folder creation
* Overwrite protection
* FFmpeg validation
* H.264 MP4 output for maximum compatibility
* System-wide installation via `/usr/local/bin`
* Help and version commands

---

## Requirements

### FFmpeg

Ubuntu / Debian:

```bash
sudo apt update
sudo apt install ffmpeg
```

Verify installation:

```bash
ffmpeg -version
```

---

## Project Structure

```text
ffmpeg-timelapse-builder/
│
├── README.md
├── LICENSE
├── install.sh
├── uninstall.sh
│
└── bin/
    └── timelapse
```

---

## Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/ffmpeg-timelapse-builder.git
```

Enter the project directory:

```bash
cd ffmpeg-timelapse-builder
```

Make scripts executable:

```bash
chmod +x install.sh
chmod +x uninstall.sh
chmod +x bin/timelapse
```

Install:

```bash
./install.sh
```

Verify installation:

```bash
which timelapse
```

Expected output:

```text
/usr/local/bin/timelapse
```

---

## Uninstallation

Remove the utility:

```bash
./uninstall.sh
```

Or manually:

```bash
sudo rm /usr/local/bin/timelapse
```

---

## Usage

Launch the application:

```bash
timelapse
```

The program will guide you through:

```text
Source folder
Output folder
Output filename
Orientation
Quality
FPS
```

Example:

```text
Source folder:
/home/roshan/photos/sunset

Output folder:
/home/roshan/videos

Output filename:
sunset_timelapse

Orientation:
1

Quality:
3

FPS:
30
```

---

## Help

Display usage information:

```bash
timelapse --help
```

---

## Version

Display installed version:

```bash
timelapse --version
```

Example:

```text
timelapse 1.0.0
```

---

## Expected Image Naming

The utility expects sequential image files such as:

```text
DSC_0001.JPG
DSC_0002.JPG
DSC_0003.JPG
DSC_0004.JPG
...
```

Supported extensions:

```text
.JPG
.jpg
.JPEG
.jpeg
```

---

## Quality Presets

| Option | Resolution   |
| ------ | ------------ |
| 1      | 1920px (HD)  |
| 2      | 2560px (HD+) |
| 3      | 3840px (4K)  |

---

## Orientation Options

### Horizontal

Recommended for:

* YouTube
* Desktop viewing
* Landscape photography
* Presentations

### Vertical

Recommended for:

* YouTube Shorts
* Instagram Reels
* TikTok
* Mobile-first platforms

---

## Output Format

Generated file:

```text
filename.mp4
```

Encoding settings:

```text
Codec: H.264 (libx264)
Pixel Format: yuv420p
CRF: 18
Preset: fast
Container: MP4
```

Compatible with:

* YouTube
* Instagram
* TikTok
* VLC
* Windows Media Player
* Android
* iOS

---

## Example Workflow

1. Import images from your camera.
2. Store them in a directory:

```text
~/photos/sunset/
```

3. Ensure filenames follow a sequence:

```text
DSC_0001.JPG
DSC_0002.JPG
DSC_0003.JPG
...
```

4. Run:

```bash
timelapse
```

5. Follow the interactive prompts.
6. Confirm the render settings.
7. Wait for FFmpeg to complete.
8. Enjoy your timelapse video.

---

## Troubleshooting

### FFmpeg Not Found

Install FFmpeg:

```bash
sudo apt install ffmpeg
```

Verify:

```bash
ffmpeg -version
```

---

### No Image Sequence Found

Ensure your files follow a sequential naming pattern:

```text
DSC_0001.JPG
DSC_0002.JPG
...
```

and are located inside the selected source directory.

---

### Output Video Is Too Large

Increase the CRF value inside the script:

```bash
-crf 18
```

Examples:

```bash
-crf 20
-crf 22
-crf 24
```

Higher values produce smaller files at the cost of quality.

---

### Rendering Is Slow

Modify the encoding preset:

```bash
-preset fast
```

Options:

```bash
-preset faster
-preset veryfast
```

Faster presets reduce encoding time but may increase file size slightly.

---

## Roadmap

Planned enhancements:

* NVIDIA NVENC hardware encoding
* Intel Quick Sync support
* Deflicker filter
* Motion blur simulation
* Video stabilization
* Automatic Shorts/Reels export
* Batch processing
* Additional output formats
* 8K export support

---

## Contributing

Contributions, suggestions, bug reports, and feature requests are welcome.

Feel free to open an issue or submit a pull request.

---

## License

Released under the MIT License. See the LICENSE file for details.

---

## Author

Roshan Dhungana

Built with Bash and FFmpeg.
