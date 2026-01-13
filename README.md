> It seems auth is currently unavailable `[HandshakeHandler] Server session token not available - cannot request auth grant` so you may not be able to fully start the server until that is resolved.

# Hytale Server Docker

Docker configuration for running Hytale server in a containerized environment.

## Usage

1. Build the Docker image:

   ```bash
   docker-compose build
   ```
2. Start the Hytale server non detached first to authenticate:

   ```bash
    docker-compose up
    ```

3. Follow the on-screen instructions to authenticate your server.
4. Once authenticated, you can run the server in detached mode:

   ```bash
   docker-compose up -d
    ```
## Official Documentation

[Hytale Server Manual](https://support.hytale.com/hc/en-us/articles/45326769420827-Hytale-Server-Manual)
