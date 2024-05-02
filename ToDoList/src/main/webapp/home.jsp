<%@page import="dao.Dao"%>
<%@page import="dto.Task"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
    .user-info {
        display: flex;
        align-items: center;
        margin-bottom: 2rem;
    }
    .user-info img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        margin-right: 1rem;
    }
    .task-table {
        width: 100%; /* Adjust as needed */
    }
</style>
<meta charset="UTF-8">
<title>Task Management</title>
</head>
<body>

  <%@ include file="template.jsp" %>
  
  <% User user = (User)request.getSession().getAttribute("user");%>
		<% String username = user.getUsername(); %>

  <div class="container">
    <div class="row user-info">
      <img alt="" src="data:image/jpeg;base64,<%= new String(Base64.getEncoder().encode(user.getUserimage())) %>" />
      <div>
        <h2>Welcome, <%= username %></h2>
        <h4>Email: <%= user.getUseremail() %></h4>
      </div>
    </div>

    <div class="row">
      <div class="col-md-6">
        <a href="addtask.jsp" class="btn btn-primary">Add Task</a>
      </div>
      <div class="col-md-6 text-end">
      
      	 <a href="profile.jsp" class="btn btn-primary">Profile</a>
        <a href="logout" class="btn btn-danger">Logout</a>
        
      </div>
       
    </div>

    <h3>Tasks</h3>
    <br>

    <% Dao dao = new Dao(); %>
    <% List<Task> tasks = dao.getalltasksByUserId(user.getUserid()); %>

    <table class="table task-table table-hover">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Title</th>
          <th scope="col">Description</th>
          <th scope="col">Priority</th>
          <th scope="col">Due Date</th>
          <th scope="col">Status</th>
          <th scope="col">Delete</th>
          <th scope="col">Edit</th>
        </tr>
      </thead>
      <tbody>
        <% int num = 1; %>
        <% for (Task task : tasks) { %>
          <tr>
            <th scope="row"><%= num %></th>
            <td><%= task.getTasktitle() %></td>
            <td><%= task.getTaskdescription() %></td>
            <td><%= task.getTaskpriority() %></td>
            <td><%= task.getTaskduedate() %></td>
            <td><%= task.getTaskstatus() %></td>
            <td><a href="delete?id=<%= task.getTaskid() %>" class="btn btn-sm btn-danger">Delete</a></td>
            <td><a href="edit?id=<%= task.getTaskid() %>" class="btn btn-sm btn-primary">Edit</a></td>
          </tr>
          <% num += 1; %>
        <% } %>
      </tbody>
    </table>
  </div>

</body>
</html>