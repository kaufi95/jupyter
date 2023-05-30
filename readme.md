# Jupyterhub setup running with DockerSpwaner and nbgrader installed to singleuser servers

## Important information

- The nbgrader extension is enabled by default for all users. This can be configured in the `nbgrader_config.py` file. This will be done at a later point.
- Sometimes the IP_ADDRESS variable in the `docker-compose.yaml` file needs to be changed to the IP address of the JupyterHub container instance. This is a known issue and will be fixed at a later point. The IP address can be found by running `docker network inspect jupyterhub-network` in the terminal when the hub is running or you can look it up on docker desktop.
  The IP address also needs to be changed in the `nbgrader_config.py` file of the singleuser image. The image needs to be removed from docker registry and be rebuilt afterwards!

## Additional information

- The `docker-compose.yaml` contains two services:
  - `lab`: This is a singleuser JupyterLab instance including nbgrader extension
  - `hub`: This is the JupyterHub container instance, which is used to spawn the singleuser instances

The singleuser image is used to spawn new singleuser instances.

## Requirements

- Docker

## Installation

1. Clone this repository
2. Build the singleuser image by running this command: `docker build -t jupyterlab-singleuser ./docker/lab`
3. Start up the system by running: `docker-compose up`

## Test workflow

This workflow shows the setup of the system and how it can be used. The workflow is based on the following scenario:

- An admin creates a course and adds an instructor to it
- The instructor adds students to the course
- The instructor creates an assignment and releases it
- The students fetch the assignment, complete it and submit it
- The instructor collects and grades the assignment and releases the feedback

1. run `docker-compose up`
2. go to `localhost:8000`
3. sign up a new users with usernames `admin1`, `instructor1`, `user1`, `user2`, `user3`
4. login with the `admin1` user
5. create a new course by opening a terminal in the container and type `cm create_course SP`
6. add the instructor to the course by typing `cm add_instructor SP instructor1 -f instructor1 -l instructor1 -e instructor1@mail`
7. login with the `instructor1` user
8. add the students to the course by typing `cm add_student SP user1 -f user1 -l user1 -e user1@mail` and `cm add_student SP user2 -f user2 -l user2 -e user2@mail` in a terminal in the container
9. create a file called `nbgrader_config.py` in the root directory and insert `c.CourseDirectory.course_id = "SP"`
10. create a folder called `source`. Insert a folder called `SP` and add a notebook to it
11. open formgrader and generate and release the assignment
12. login with the users `user1` and `user2` and fetch, complete and save the assignments
13. login with the user `user3` -> this user should not be able to see or fetch the assignment
14. run `docker exec -it jupyter-user1 /bin/bash` and type `rm -rf /home/user1/SP/.ipynb_checkpoints`
15. run `docker exec -it jupyter-user2 /bin/bash` and type `rm -rf /home/user2/SP/.ipynb_checkpoints`
16. submit the assignments
17. login with the `instructor1` user
18. collect and grade the assignment and generate and release the feedback
19. logout with all users
20. run `docker compose down`

## Notes

To view the courses, assigned instructors and students, login with the admin1 user and head to the following links:

- http://localhost:8000/services/ngshare/courses
- http://localhost:8000/services/ngshare/instructors/SP
- http://localhost:8000/services/ngshare/students/SP

## TODO

- Fix issue with .ipynb_checkpoint files, so nbgrader does not throw an error when fetching assignments (https://github.com/LibreTexts/ngshare/issues/161)
- Fix issue with fetching feedbach
- Fix issue with IP_ADDRESS variable in docker-compose.yaml file
- Fix issue with ip address in nbgrader_config.py file
- Fix issue with nbgrader extension being enabled by default for all users
- Fix error log (admin1)
- Remove GRANT_SUDO, so new packages can't be installed
- Restrict other ways to cheat / communicate with other students (pip, ...)
- Clean up code
