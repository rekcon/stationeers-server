
FROM steamcmd/steamcmd:ubuntu-22

LABEL maintainer="rekcon <rekconcubix@gmail.com>"

# Fixes apt-get warnings
ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libsdl2-2.0-0:i386 \
        net-tools \
        locales \
        screen && \
	rm -rf /var/lib/apt/lists/*

# Enable UTF-8
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

# Create and set the steamcmd folder as a volume
RUN mkdir -p /stationeers

# Add the steamcmd installation script
ADD install.txt /app/install.txt

# Copy the startup script
ADD start_stationeers.sh /app/start.sh
ADD create_screen.sh /app/create_screen.sh

# Set the current working directory
WORKDIR /

# Setup default environment variables for the server
ENV STATIONEERS_SERVER_STARTUP_ARGUMENTS "-autostart -nographics -batchmode"
ENV STATIONEERS_SERVER_NAME "A Docker Server"
ENV STATIONEERS_WORLD_NAME "docker"
ENV STATIONEERS_WORLD_TYPE "moon"
ENV STATIONEERS_SERVER_SAVE_INTERVAL "300"
ENV STATIONEERS_GAME_PORT "27016"
ENV STATIONEERS_QUERY_PORT "27015"
ENV STATIONEERS_SERVER_PASSWORD ""
ENV STATIONEERS_SERVER_SECRET ""
ENV STATIONEERS_SETTINGS_PATH ""

# Run as a non-root user by default
ENV PGID 1000
ENV PUID 1000

# Expose necessary ports
EXPOSE 27016/tcp
EXPOSE 27016/udp
EXPOSE 27015/udp

# Define directories to take ownership of
ENV CHOWN_DIRS "/app,/stationeers"

# Expose the volumes
# VOLUME ["/stationeers"]

# Start the server
ENTRYPOINT ["bash"]
CMD ["/app/create_screen.sh"]
