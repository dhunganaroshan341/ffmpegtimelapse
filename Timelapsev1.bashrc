timelapse() {

    echo "================================="
    echo "      FFmpeg Timelapse Builder"
    echo "================================="

    # Check FFmpeg
    if ! command -v ffmpeg >/dev/null 2>&1; then
        echo "Error: ffmpeg is not installed."
        return 1
    fi

    echo ""
    read -p "Source folder: " SOURCE

    if [ ! -d "$SOURCE" ]; then
        echo "Error: Source folder does not exist."
        return 1
    fi

    read -p "Output folder [/home/$USER/timelapse]: " DEST

    if [ -z "$DEST" ]; then
        DEST="/home/$USER/timelapse"
    fi

    mkdir -p "$DEST"

    echo ""
    read -p "Output filename (without .mp4): " FILENAME

    if [ -z "$FILENAME" ]; then
        echo "Error: Filename cannot be empty."
        return 1
    fi

    OUTPUT="$DEST/$FILENAME.mp4"

    if [ -f "$OUTPUT" ]; then
        echo ""
        read -p "File already exists. Overwrite? (y/N): " OVERWRITE

        case "$OVERWRITE" in
            y|Y) ;;
            *)
                echo "Cancelled."
                return 1
                ;;
        esac
    fi

    echo ""
    echo "Choose orientation:"
    echo "1) Horizontal"
    echo "2) Vertical"
    read -p "Selection [1]: " ORIENTATION

    if [ -z "$ORIENTATION" ]; then
        ORIENTATION=1
    fi

    echo ""
    echo "Choose quality:"
    echo "1) HD    (1920)"
    echo "2) HD+   (2560)"
    echo "3) 4K    (3840)"
    read -p "Selection [1]: " QUALITY

    if [ -z "$QUALITY" ]; then
        QUALITY=1
    fi

    echo ""
    read -p "FPS [30]: " FPS

    if [ -z "$FPS" ]; then
        FPS=30
    fi

    case $QUALITY in
        1) SIZE=1920 ;;
        2) SIZE=2560 ;;
        3) SIZE=3840 ;;
        *) SIZE=1920 ;;
    esac

    if [ "$ORIENTATION" = "2" ]; then
        SCALE="-2:${SIZE}"
    else
        SCALE="${SIZE}:-2"
    fi

    # Detect image extension
    if ls "$SOURCE"/DSC_*.JPG >/dev/null 2>&1; then
        EXT="JPG"
    elif ls "$SOURCE"/DSC_*.jpg >/dev/null 2>&1; then
        EXT="jpg"
    elif ls "$SOURCE"/DSC_*.JPEG >/dev/null 2>&1; then
        EXT="JPEG"
    elif ls "$SOURCE"/DSC_*.jpeg >/dev/null 2>&1; then
        EXT="jpeg"
    else
        echo ""
        echo "Error: No DSC_XXXX image sequence found."
        echo "Expected files like:"
        echo "DSC_0001.JPG"
        echo "DSC_0002.JPG"
        return 1
    fi

    IMAGE_COUNT=$(find "$SOURCE" -maxdepth 1 -type f -name "DSC_*.$EXT" | wc -l)

    if [ "$IMAGE_COUNT" -eq 0 ]; then
        echo "Error: No images found."
        return 1
    fi

    DURATION=$(awk "BEGIN { printf \"%.2f\", $IMAGE_COUNT / $FPS }")

    echo ""
    echo "---------------------------------"
    echo "Images found : $IMAGE_COUNT"
    echo "FPS          : $FPS"
    echo "Resolution   : $SIZE"
    echo "Duration     : ${DURATION}s"
    echo "Output       : $OUTPUT"
    echo "---------------------------------"
    echo ""

    read -p "Start rendering? (Y/n): " CONFIRM

    case "$CONFIRM" in
        n|N)
            echo "Cancelled."
            return 1
            ;;
    esac

    echo ""
    echo "Building timelapse..."
    echo ""

    ffmpeg \
        -hide_banner \
        -stats \
        -y \
        -framerate "$FPS" \
        -start_number 1 \
        -i "$SOURCE/DSC_%04d.$EXT" \
        -vf "scale=${SCALE}" \
        -c:v libx264 \
        -preset fast \
        -crf 18 \
        -pix_fmt yuv420p \
        "$OUTPUT"

    if [ $? -eq 0 ]; then
        echo ""
        echo "================================="
        echo "Done!"
        echo "Saved to:"
        echo "$OUTPUT"
        echo "================================="
    else
        echo ""
        echo "FFmpeg failed."
        return 1
    fi
}