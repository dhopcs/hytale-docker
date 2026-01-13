> It seems auth is currently unavailable `[HandshakeHandler] Server session token not available - cannot request auth grant` so you may not be able to fully start the server until that is resolved.

# Hytale Server Docker

Docker configuration for running Hytale server in a containerized environment.

https://hub.docker.com/r/dhopcs/hytale-server

## Docker Compose Setup

```yaml
services:
  hytale-server:
    image: dhopcs/hytale-server:latest
    container_name: hytale-server
    restart: unless-stopped
    ports:
      - "5520:5520/udp"
    volumes:
      - hytale-data:/hytale  # All server files and data
      - ~/.hytale-downloader-credentials.json:/root/.hytale-downloader-credentials.json  # OAuth credentials
    environment:
      - JAVA_TOOL_OPTIONS=-Xmx4G -Xms2G
    stdin_open: true
    tty: true
```

## Usage

1. Start the Hytale server non detached first to authenticate:

   ```bash
    docker-compose up
    ```

2. Follow the on-screen instructions to authenticate your server.
3. Once authenticated, you can run the server in detached mode:

   ```bash
   docker-compose up -d
    ```
## Official Documentation

[Hytale Server Manual](https://support.hytale.com/hc/en-us/articles/45326769420827-Hytale-Server-Manual)
