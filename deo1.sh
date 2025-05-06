# Use expect-like approach with co-processes for true interactive automation
echo "${YELLOW}Starting interactive session - will use predefined responses for known prompts${RESET}"
echo "${YELLOW}and ask for input on any unexpected prompts${RESET}"

# A simpler and more robust approach that combines automation with manual interaction
# This uses process substitution and the 'script' utility to capture all interaction
tmpfile=$(mktemp)
(
  # First, feed in our known responses
  sleep 0.5
  echo "yes"
  sleep 0.5
  echo "Berlin"
  sleep 0.5
  echo ""
  sleep 0.5
  echo "1"
  
  # Then switch to interactive mode for any unexpected prompts
  # This means the terminal is passed through to the script
  cat
) | (script -q -c "./script.sh" "$tmpfile")
