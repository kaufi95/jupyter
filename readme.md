# Jupyterhub setup running in Docker with DockerSpwaner and nbgrader installed to singleuser servers

## Requirements

- Docker

## Installation

1. Clone this repository
2. Build the singluar image by running this command: `docker build -t jupyterlab-singleuser ./lab`
3. Start up the system by running `docker-compose up`

## Usage

1. Navigate to `localhost:8000` in your browser
2. Create a new account with the username `myadmin` and password `myadmin`
3. Login with the created user

## Notes

- The nbgrader extension is enabled by default for all users. This can be configured in the `nbgrader_config.py` file. This will be done at a later point.
- Sometimes the IP_ADDRESS variable in the `docker-compose.yaml` file needs to be changed to the IP address of the machine running the docker containers. This is a known issue and will be fixed at a later point. The IP address can be found by running `docker network inspect jupyterhub-network` in the terminal.
