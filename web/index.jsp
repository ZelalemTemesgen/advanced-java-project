<%-- 
    Document   : index
    Created on : Oct 11, 2022, 12:29:49 PM
    Author     : Mihreteab
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>University Management System</title>
<h1 color="yello"> WELCOME TO MARWADI UNINVERSITY </h1>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" 
      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<style>
body {  
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url("Marwadi.jpeg");    
}
</style>
</head>
<body style="padding:250px" >
        
        <div>         
<a href="addStudent.jsp"  class="btn btn-success">Add Student</a>
<a href="addTeacher.jsp"  class="btn btn-primary">Add Teacher</a>
<a href="viewStudent.jsp" class="btn btn-warning">View Student</a>
<a href="viewTeacher.jsp"  class="btn btn-danger">View Teacher</a>
</div>
</body>
</html>

