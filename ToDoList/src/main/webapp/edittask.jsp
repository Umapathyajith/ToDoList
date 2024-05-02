<%@page import="dto.Task"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<% Task task = (Task)request.getAttribute("task"); %>
	

		<form action="updatetask" method="post">
	    task id:<input type="text" name="taskid" hidden="" value="<%=task.getTaskid() %>" readonly><br>
		task title:<input type="text" name="tasktitle" value="<%=task.getTasktitle() %>" required><br>
		task description:<input type="text" name="taskdescription" value="<%=task.getTaskdescription() %>"><br>
		Current task priority:<h4><%= task.getTaskpriority() %></h4>
		Task priority:<br>
		 <label for="option1">
            <input type="radio" id="option1" value="low" name="taskpriority" > Low 
        </label><br>
        <label for="option2">
            <input type="radio" id="option2" value="medium" name="taskpriority" >  Medium
        </label><br>
        <label for="option3">
            <input type="radio" id="option3" value="high" name="taskpriority" > High 
        </label><br>
		Due Date:<input type="date" name="taskduedate" value="<%=task.getTaskduedate() %>"><br>
		Status:<input type="text" name="taskstatus" value="<%=task.getTaskstatus() %>"><br>
		
		<input type="submit">
		
	
	
	</form>
	
	
	
</body>
</html>