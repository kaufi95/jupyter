# Jupyterhub setup running with DockerSpwaner and nbgrader installed to singleuser servers

## Requirements

- Docker

## Notes

- The nbgrader extension is enabled by default for all users. This can be configured in the `nbgrader_config.py` file. This will be done at a later point.
- Sometimes the IP_ADDRESS variable in the `docker-compose.yaml` file needs to be changed to the IP address of the JupyterHub container instance. This is a known issue and will be fixed at a later point. The IP address can be found by running `docker network inspect jupyterhub-network` in the terminal when the hub is running or you can look it up on docker desktop.
  The IP address also needs to be changed in the `nbgrader_config.py` file of the singleuser image. The image needs to be rebuilt afterwards.

## Installation

1. Clone this repository
2. Build the singleuser image by running this command: `docker build -t jupyterlab-singleuser ./docker/lab`
3. Start up the system by running: `docker-compose up`

## Test setup

1. run `docker-compose up`
2. go to `localhost:8000`
3. sign up a new users with usernames `admin1`, `instructor1`, `user1`
4. login with the admin1 user
5. create a new course by opening a terminal in container and type `cm create_course SP`
6. add the instructor to the course by typing `cm add_instructor SP -f instructor1 -l instructor1 -e instructor1@mail`
7. add the student to the course by typing `cm add_student SP -f user1 -l user1 -e user1@mail`
8. login with the instructor1 user
9. create a folder called `source`. Insert a folder called `SP` and add a notebook to it
10. open formgrader and generate and release the assignment
11. login with the user1 user
12. fetch the assignment and complete it
13. submit the assignment
14. login with the instructor1 user
15. grade the assignment and generate and release the feedback
16. login with the user1 user
17. fetch the feedback
18. logout
