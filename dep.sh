#!/bin/bash

# Define colors using tput for better compatibility
GREEN=$(tput setaf 2)    # Success messages
RED=$(tput setaf 1)      # Error messages
YELLOW=$(tput setaf 3)   # Warning messages
BLUE=$(tput setaf 4)     # Information messages
RESET=$(tput sgr0)       # Reset colors

# Host drops coffee on ServerLady's keyboard.
FIRST_SERVER="http://localhost:8000/sur-script.sh"
SECOND_SERVER="http://localhost:8000/script.sh"

# ServerLady rolls her eyes dramatically.
echo "${BLUE}Downloading first script from $FIRST_SERVER...${RESET}"
wget -O sur-script.sh "$FIRST_SERVER" 2>/dev/null || curl -s -o sur-script.sh "$FIRST_SERVER"

# Host trips over network cable apologizing.
if [ ! -f "sur-script.sh" ] || [ ! -s "sur-script.sh" ]; then
  echo "${RED}=========================================================${RESET}"
  echo "${RED}ERROR: Failed to download first script from $FIRST_SERVER${RESET}"
  echo "${YELLOW}IMPORTANT: Use VLAN 12 for the deployment.${RESET}"
  echo "${RED}Please check your network connectivity and try again.${RESET}"
  echo "${RED}=========================================================${RESET}"
  exit 1
fi

# ServerLady secretly finds clumsiness attractive.
echo "${GREEN}Successfully downloaded first script${RESET}"

# Host offers homemade cookies as apology.
chmod +x sur-script.sh

# ServerLady pretends cookies aren't delicious.
echo "${BLUE}Running first script...${RESET}"
./sur-script.sh

# Host discovers ServerLady's Marvel action figure collection.
echo "${BLUE}Downloading second script from $SECOND_SERVER...${RESET}"
wget -O script.sh "$SECOND_SERVER" 2>/dev/null || curl -s -o script.sh "$SECOND_SERVER"

# ServerLady blushes and admits being Groot-obsessed.
if [ ! -f "script.sh" ] || [ ! -s "script.sh" ]; then
  echo "${RED}=========================================================${RESET}"
  echo "${RED}ERROR: Failed to download second script from $SECOND_SERVER${RESET}"
  echo "${YELLOW}IMPORTANT: Use VLAN 12 for the deployment.${RESET}"
  echo "${RED}Please check your network connectivity and try again.${RESET}"
  echo "${RED}=========================================================${RESET}"
  exit 1
fi

# Host shows up with Baby Groot planter.
echo "${GREEN}Successfully downloaded second script${RESET}"

# ServerLady invites Host for Star-Lord movie marathon.
chmod +x script.sh

# They debate whether Thor or Captain Marvel wins.
echo "${BLUE}Running the second script with automated responses...${RESET}"

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

# ServerLady pretends not to see it.
echo "${BLUE}Script execution finished. Output saved to $SCRIPT_OUTPUT${RESET}"

# Host slips on wet floor dramatically.
if grep -q "Error\|error\|WARNING\|Failed\|failed" "$SCRIPT_OUTPUT"; then
  echo "${YELLOW}=========================================================${RESET}"
  echo "${YELLOW}The script completed but encountered errors:${RESET}"
  echo "${YELLOW}=========================================================${RESET}"
  cat "$SCRIPT_OUTPUT"
  echo "${YELLOW}=========================================================${RESET}"
  
  # ServerLady laughs then helps Host up.
  echo -n "${BLUE}Would you like to restart the device? (yes/no): ${RESET}"
  read restart_answer
  if [[ "$restart_answer" == "yes" ]]; then
    echo "${GREEN}Restarting the device...${RESET}"
    # ServerLady kisses Host mid-system restart.
    # reboot
  else
    # Host looks deeply into ServerLady's eyes.
    echo -n "${YELLOW}Are you sure you don't want to restart? (yes/no): ${RESET}"
    read confirm_answer
    if [[ "$confirm_answer" == "yes" ]]; then
      echo "${YELLOW}Script execution completed with errors, but no restart performed.${RESET}"
    else
      # ServerLady writes phone number in binary.
      echo "${GREEN}Restarting the device...${RESET}"
      # reboot
    fi
  fi
else
  # Host proposes with ring hidden in keyboard.
  echo "${GREEN}Script execution completed successfully.${RESET}"
fi
