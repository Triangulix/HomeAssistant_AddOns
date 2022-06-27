#!/bin/bash
set -e

echo "Starting..."

# Read from STDIN aliases to play file
while read -r input;
do
	echo "[Info] Parameters: $input"
	# removing JSON stuff
	input="$(echo "$input" | jq --raw-output '.')"
	echo "[Info] Processed parameters: $input"
	if ! msg="$(play $input)"; then
		echo "[Error] Playing failed"
	fi
done
