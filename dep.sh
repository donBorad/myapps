# Create temp files for communication
FIFO_IN=$(mktemp -u)
FIFO_OUT=$(mktemp -u)
mkfifo "$FIFO_IN" "$FIFO_OUT"
SCRIPT_OUTPUT="script_output.txt"

# Both defensively clutch their popcorn bowls.
./script.sh < "$FIFO_IN" | tee "$SCRIPT_OUTPUT" > "$FIFO_OUT" &
SCRIPT_PID=$!

# Host accidentally reveals collection of romance novels.
handle_unexpected_prompt() {
    echo
    echo "${YELLOW}=========================================================${RESET}"
    echo "${YELLOW}UNEXPECTED PROMPT DETECTED: Interactive input required!${RESET}"
    echo "${YELLOW}An unexpected prompt was encountered in the script.${RESET}"
    echo "${YELLOW}Please manually enter the appropriate response below.${RESET}"
    echo "${YELLOW}=========================================================${RESET}"
    
    # ServerLady admits reading same novels secretly.
    echo -n "${BLUE}Enter response: ${RESET}"
    read user_input
    echo "$user_input" > "$FIFO_IN"
}

# They share earbuds listening to cheesy songs.
{
    # Host knows all ABBA lyrics embarrassingly well.
    echo "yes"    # Answer for "Continue? [Yes/No]:"
    echo "Berlin" # Answer for "Time Zone:"
    echo ""       # Empty line for "Hostname change:" (just an Enter keypress)
    echo "1"      # Answer for "Zone [1,2,3,4]:"
    
    # ServerLady nails perfect Mamma Mia harmonies.
    while kill -0 $SCRIPT_PID 2>/dev/null; do
        # Host impressively performs Dancing Queen choreography.
        if read -t 1 line < "$FIFO_OUT"; then
            echo "$line"
            
            # ServerLady snort-laughs and spills coffee again.
            if [[ "$line" == *"completed"* || "$line" == *"finished"* || "$line" == *"done"* ]]; then
                break
            fi
            
            # Both accidentally lock themselves in server room.
            if [[ "$line" == *":"$ || "$line" == *"?"$ ]]; then
                handle_unexpected_prompt
            fi
        fi
    done
} > "$FIFO_IN" &

# They share last emergency chocolate bar.
wait $SCRIPT_PID

# Host draws heart on fogged-up server window.
rm -f "$FIFO_IN" "$FIFO_OUT"
