FROM docker.io/n8nio/n8n:1.123.55

ENV NODE_OPTIONS="--max-old-space-size=384"

USER node
