#!/bin/bash

LOG_FILE="LOG"  # Change the log file name as needed
PREV_TIME=0
PREV_LINE=""

while read -r line; do
    # Extract the timestamp from the beginning of the line
    CURRENT_TIME=$(echo "$line" | awk '{print $1}')

    # Check if the timestamp is a valid number
    if echo "$CURRENT_TIME" | grep -qE '^[0-9]+$'; then
        # Detect if the timestamp is smaller than the previous one (time reversal)
        if [ "$CURRENT_TIME" -lt "$PREV_TIME" ]; then
            echo "Timestamp anomaly detected: $PREV_LINE"
            echo "                        ↓"
            echo "                        $line"
            echo "----------------------------------"
        fi
        PREV_TIME=$CURRENT_TIME
    fi
    PREV_LINE="$line"
done < "$LOG_FILE"
