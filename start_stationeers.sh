#!/usr/bin/env sh

# Enable debugging
#set -x

# Setup error handling
set -e

# Print the user we're currently running as
echo "Running as user: $(whoami)"

# Check that Stationeers exists in the first place
if [ ! -f "/stationeers/rocketstation_DedicatedServer.x86_64" ]; then
	# Install Stationeers from install.txt
	echo ""
	echo "Installing Stationeers.."
	echo ""
	steamcmd +runscript /app/install.txt
else
	# Install Stationeers from install.txt
	echo ""
	echo "Updating Stationeers.."
	echo ""
	steamcmd +runscript /app/install.txt
fi

# Remove extra whitespace from startup command
STATIONEERS_STARTUP_COMMAND=$(echo "$STATIONEERS_SERVER_STARTUP_ARGUMENTS" | tr -s " ")

# Set the world name
if [ ! -z ${STATIONEERS_WORLD_NAME+x} ]; then
	STATIONEERS_STARTUP_COMMAND="${STATIONEERS_STARTUP_COMMAND} -loadlatest ${STATIONEERS_WORLD_NAME} ${STATIONEERS_WORLD_TYPE}"
fi

if [ ! -z ${STATIONEERS_SETTINGS_PATH+x} ]; then
	STATIONEERS_STARTUP_COMMAND="${STATIONEERS_STARTUP_COMMAND} -settingspath \"${STATIONEERS_SETTINGS_PATH}\""
fi

if [ -z ${STATIONEERS_SETTINGS_PATH+x} ]; then
	STATIONEERS_STARTUP_COMMAND="${STATIONEERS_STARTUP_COMMAND} -settings StartLocalHost true GamePort ${STATIONEERS_GAME_PORT} ServerName \"${STATIONEERS_SERVER_NAME}\" ServerPassword \"${STATIONEERS_SERVER_PASSWORD}\" AutoSave true SaveInterval ${STATIONEERS_SERVER_SAVE_INTERVAL} ServerAuthSecret \"${STATIONEERS_SERVER_SECRET}\""
fi


# Set the working directory
cd /stationeers

# Run the server
echo ""
echo "Starting Stationeers with arguments: ${STATIONEERS_STARTUP_COMMAND}"
echo ""
./rocketstation_DedicatedServer.x86_64 \
  ${STATIONEERS_STARTUP_COMMAND}
