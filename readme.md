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
5. create a new course by opening a terminal in the container and type `cm create_course SP`
6. add the instructor to the course by typing `cm add_instructor SP instructor1 -f instructor1 -l instructor1 -e instructor1@mail`
7. login with the instructor1 user
8. add the student to the course by typing `cm add_student SP user1 -f user1 -l user1 -e user1@mail` in a terminal in the container
9. create a file called `nbgrader_config.py`in the root directory and insert `c.CourseDirectory.course_id = "SP"`
10. create a folder called `source`. Insert a folder called `SP` and add a notebook to it
11. open formgrader and generate and release the assignment
12. login with the user1 user
13. fetch the assignment and complete it
14. submit the assignment
15. login with the instructor1 user
16. grade the assignment and generate and release the feedback
17. login with the user1 user
18. fetch the feedback
19. logout

## Infromation

To view the courses, assigned instructors and students, login with the admin1 user and go to the following links:

- http://localhost:8000/services/ngshare/courses
- http://localhost:8000/services/ngshare/instructors/SP
- http://localhost:8000/services/ngshare/students/SP

## TODO

- Fix issue with .ipynb_checkpoint files, so nbgrader does not throw an error when fetching assignments and generates the needed timestamp.txt file
- Fix issue with IP_ADDRESS variable in docker-compose.yaml file
- Fix issue with ip address in nbgrader_config.py file
- Fix issue with nbgrader extension being enabled by default for all users
