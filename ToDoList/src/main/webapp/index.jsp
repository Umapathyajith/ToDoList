<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
        
        .center-right {
            position: absolute;
            top: 50%;
            right: 25%;
            transform: translate(0, -50%);
            text-align: center;
        }
    </style>
</head>
<body>

 <%@ include file="template.jsp" %>
	
	<div class="center-right">
		<a href="login.jsp">Login</a><br>
	<a href="signup.jsp">Signup</a>
	
	</div>
	
	
	
</body>
</html>