FROM docker.io/n8nio/n8n:2.30.4

ENV NODE_OPTIONS="--max-old-space-size=384"

USER node
