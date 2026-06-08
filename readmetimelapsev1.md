# FFmpeg Timelapse Builder

A simple Bash function for creating timelapse videos from DSLR or camera image sequences using FFmpeg.

Designed for photographers and hobbyists who want a quick command-line workflow without learning complex FFmpeg commands.

---

## Features

* Interactive terminal prompts
* Supports horizontal and vertical videos
* HD, HD+, and 4K output presets
* Custom FPS selection
* Automatic image sequence detection
* Image count and estimated video duration
* Output folder creation
* Overwrite protection
* FFmpeg validation
* H.264 MP4 output compatible with most devices and platforms

---

## Requirements

### FFmpeg

Ubuntu/Debian:

```bash
sudo apt update
sudo apt install ffmpeg
```

Verify installation:

```bash
ffmpeg -version
```

---

## Installation

Open your Bash configuration file:

```bash
nano ~/.bashrc
```

Paste the `timelapse()` function into the file.

Reload Bash:

```bash
source ~/.bashrc
```

Verify the function is available:

```bash
type timelapse
```

Expected output:

```bash
timelapse is a function
```

---

## Expected Image Naming

The script expects sequential image files named like:

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

## Usage

Run:

```bash
timelapse
```

The script will ask:

```text
Source folder:
Output folder:
Output filename:
Orientation:
Quality:
FPS:
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

## Quality Presets

| Option | Resolution  |
| ------ | ----------- |
| 1      | 1920px      |
| 2      | 2560px      |
| 3      | 3840px (4K) |

---

## Orientation Options

### Horizontal

Ideal for:

* YouTube
* Desktop viewing
* Landscape footage

### Vertical

Ideal for:

* YouTube Shorts
* Instagram Reels
* TikTok
* Mobile viewing

---

## Output Format

Generated video:

```text
filename.mp4
```

Encoding:

```text
Codec: H.264 (libx264)
Pixel Format: yuv420p
CRF: 18
Preset: fast
```

Compatible with:

* YouTube
* Instagram
* TikTok
* VLC
* Windows Media Player
* Mobile devices

---

## Example Workflow

1. Import photos from camera.
2. Place them in a folder:

```text
~/photos/sunset/
```

3. Ensure filenames follow:

```text
DSC_0001.JPG
DSC_0002.JPG
...
```

4. Run:

```bash
timelapse
```

5. Follow prompts.

6. Wait for rendering to finish.

7. Enjoy your timelapse video.

---

## Troubleshooting

### FFmpeg not found

Install FFmpeg:

```bash
sudo apt install ffmpeg
```

---

### No image sequence found

Ensure images follow:

```text
DSC_0001.JPG
DSC_0002.JPG
...
```

and are located in the source directory.

---

### Output video is too large

Increase CRF value in the script:

```bash
-crf 18
```

Examples:

```bash
-crf 20
-crf 22
-crf 24
```

Higher value = smaller file size.

---

### Rendering is slow

Change:

```bash
-preset fast
```

to:

```bash
-preset veryfast
```

or

```bash
-preset faster
```

---

## Future Improvements

Possible enhancements:

* Hardware encoding (NVIDIA NVENC)
* Intel Quick Sync support
* Deflicker filter
* Motion blur
* Image stabilization
* Automatic Shorts/Reels export
* Multiple output formats
* 8K export support

---

## License

Free to use, modify, and distribute.

Built with Bash and FFmpeg.
