from ngshare_exchange import configureExchange

c = get_config()

c.ClearSolutions.code_stub = {
    "c": "// your code here",
    "C++11": "// your code here",
}

c.CourseDirectory.root = "/home/jovyan"

# Note: It's important to specify the right ngshare URL when not using k8s
configureExchange(c, "http://172.22.0.2:10101/services/ngshare")

# Add the following to let students access courses without configuration
# For more information, read Notes for Instructors in the documentation
c.CourseDirectory.course_id = "*"
