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

curl -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
     -H "Content-type: application/json" \
     -d "{\"chat_id\": \"${CHAT_ID}\", \"text\": \"$*\"}"