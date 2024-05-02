<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    .form-card {
        max-width: 400px; /* Adjust form width as needed */
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.8); /* Adjust background color and opacity as needed */
        border-radius: 10px;
    }
   
    
</style>
</head>
<body class="my-5">

<%@ include file="template.jsp" %>

<div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card form-card">
                    <div class="card-body">
                    <h5 class="text-center mb-4" style="color: #c23da1;"  >Enter the registered Email</h5>
                        <form action="forgotpassword" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label small">Email</label>
                                <input type="email" class="form-control form-control-sm" id="email" name="email" required>
                            </div>
                            <button type="submit" class="btn btn-primary" >Submit</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- You can leave the right side empty or use it for other content -->
        </div>
    </div>

</body>
</html>