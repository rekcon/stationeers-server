# Stationeers server that runs inside a Docker container

**NOTE**: This image will install/update on startup. The path ```/steamcmd/stationeers``` can be mounted on the host for data persistence.

## How to run the server

1. Set the environment variables you wish to modify from below
2. Optionally mount ```/steamcmd/stationeers``` somewhere on the host or inside another container to keep your data safe
3. Enjoy!

The following environment variables are available:
```
STATIONEERS_SERVER_STARTUP_ARGUMENTS (DEFAULT: "-autostart -nographics -batchmode" - Default startup arguments)
STATIONEERS_SERVER_NAME (DEFAULT: "A Docker Server" - Publicly visible server name)
STATIONEERS_WORLD_NAME  (DEFAULT: "docker" - World name, mainly used for save names etc.)
STATIONEERS_WORLD_TYPE  (DEFAULT: "moon" - World type, mainly used for save names etc.)
STATIONEERS_SERVER_SAVE_INTERVAL (DEFAULT: "300" - Automatic save interval in seconds)
STATIONEERS_GAME_PORT (DEFAULT: "27500" - Used for both incoming client connections (UDP) and the web-interface (TCP))
STATIONEERS_QUERY_PORT (DEFAULT: "27015" - Steam query port (UDP))
STATIONEERS_SERVER_PASSWORD (DEFAULT: "" - Server password)
```

## Anything else

Thanks to Didstopia for the basis for this docker

## License

See [LICENSE](LICENSE).
