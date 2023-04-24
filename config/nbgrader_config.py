c = get_config()
c.Exchange.root = "/opt/exchange"
c.CourseDirectory.course_id = "example_course"
c.ClearSolutions.code_stub = {
    "c": "// your code here\nthrow new NotImplementedException();",
    "C++11": "// your code here\nthrow new NotImplementedException();",
}
