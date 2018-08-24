#! /bin/bash
echo "# Binding Taskbook"

echo "{
    \"taskbookDirectory\": \"/Users/${USER}/Library/Mobile Documents/com~apple~CloudDocs/dynamic/taskbook/\",
    \"displayCompleteTasks\": true,
    \"displayProgressOverview\": true
}" > ~/.taskbook.json
