<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

	

	
	
	
	
	  <style>
	  
	  
	    body {
        /* Set the background image */
        background-image: url('signup.jpg');
        /* Scale the background image to cover the entire screen */
        background-size: cover;
        /* Center the background image */
        background-position: center;
        /* Fix the background image while scrolling */
        background-attachment: fixed;
        /* Set minimum height of the body to cover the viewport height */
        min-height: 100vh;
        /* Center the content vertically */
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .form-card {
        max-width: 400px; /* Adjust form width as needed */
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.8); /* Adjust background color and opacity as needed */
        border-radius: 10px;
    }
</style>
<body>



<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card form-card">
                <div class="card-body">
                    <form action="saveuser" method="post" enctype="multipart/form-data">
                        
                        <div class="mb-3">
                            <label for="name" class="form-label small">Name</label>
                            <input type="text" class="form-control form-control-sm"  id="name" name="name">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label small">Email</label>
                            <input type="email" class="form-control form-control-sm"  id="email" name="email">
                        </div>
                        <div class="mb-3">
                            <label for="contact" class="form-label small">Contact</label>
                            <input type="text" class="form-control form-control-sm"  id="contact" name="contact">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label small">Password</label>
                            <input type="password" class="form-control form-control-sm"  id="password" name="password">
                        </div>
                        <div class="mb-3">
                            <label for="image" class="form-label small">Image</label>
                            <input type="file" class="form-control form-control-sm"  id="image" name="image">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
