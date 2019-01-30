#!/bin/sh
set -eu

if [[ -z "$TELEGRAM_BOT_TOKEN" ]]; then
  echo "Set the TELEGRAM_BOT_TOKEN secret."
  exit 1
fi

if [[ -z "$CHAT_ID" ]]; then
  echo "Set the CHAT_ID secret."
  exit 1
fi

sender=$(cat /github/workflow/event.json | jq ".sender.login")
repo_name=$(cat /github/workflow/event.json | jq ".repository.name")
commit_message=$(cat /github/workflow/event.json | jq ".commits[0].message")
commit_url=$(cat /github/workflow/event.json | jq ".commits[0].url")

message="⌨️ ${repo_name}\n👤 ${sender}\n${commit_message}\n${commit_url}"

curl -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
     -H "Content-type: application/json" \
     -d "{\"chat_id\": \"${CHAT_ID}\", \"text\": \"${message}\"}"