FROM debian:9.6-slim

LABEL "com.github.actions.name"="Post Telegram message"
LABEL "com.github.actions.description"="Post a message in Telegram"
LABEL "com.github.actions.icon"="hash"
LABEL "com.github.actions.color"="white"

LABEL version="1.0.0"
LABEL repository="https://github.com/frankdilo/telegram-action"
LABEL homepage="https://github.com/frankdilo/telegram-action"
LABEL maintainer="Francesco Di Lorenzo <fradilorenzo92@gmail.com>"

RUN apt-get update && apt-get install -y curl

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
