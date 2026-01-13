FROM eclipse-temurin:25-jre-jammy

WORKDIR /hytale

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    unzip \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q https://downloader.hytale.com/hytale-downloader.zip && \
    unzip -q hytale-downloader.zip && \
    chmod +x hytale-downloader-linux-amd64 && \
    rm hytale-downloader.zip

RUN mkdir -p /hytale/universe /hytale/mods /hytale/logs

EXPOSE 5520/udp

RUN echo '#!/bin/bash\n\
set -e\n\
\n\
echo "Checking for Hytale server files..."\n\
if [ ! -f "/hytale/Server/HytaleServer.jar" ]; then\n\
    echo "Server files not found. Downloading latest release..."\n\
    cd /hytale\n\
    ./hytale-downloader-linux-amd64 -download-path /hytale/game.zip\n\
    \n\
    echo "Extracting server files..."\n\
    unzip -q /hytale/game.zip -d /hytale\n\
    rm /hytale/game.zip\n\
    echo "Server files extracted successfully"\n\
else\n\
    echo "Server files found"\n\
fi\n\
\n\
cd /hytale/Server\n\
exec java -jar HytaleServer.jar --assets /hytale/Assets.zip "$@"\n\
' > /entrypoint.sh && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
