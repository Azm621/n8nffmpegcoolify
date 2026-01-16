############# It was used first and then ffmpeg was not working ##############
# Stage 1: FFmpeg
#FROM alpine:3.19 AS ffmpeg
#RUN apk add --no-cache ffmpeg

# Stage 2: n8n (pinned version)
#FROM docker.n8n.io/n8nio/n8n:2.3.5

#USER root

# Copy ffmpeg binary + required libs
#COPY --from=ffmpeg /usr/bin/ffmpeg /usr/bin/ffmpeg
#COPY --from=ffmpeg /usr/lib /usr/lib

# Ensure executable
#RUN chmod +x /usr/bin/ffmpeg

#USER node
############# It was used first and then ffmpeg was not working ##############



FROM docker.n8n.io/n8nio/n8n:2.3.5

USER root

# Install full ffmpeg with all libraries
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER node
