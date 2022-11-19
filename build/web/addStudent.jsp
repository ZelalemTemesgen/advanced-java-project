<%-- 
    Document   : addStudent
    Created on : Oct 11, 2022, 4:16:59 PM
    Author     : Mihreteab
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>University Management System</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" 
      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <style>
            body {
                background-position: center;
                background-repeat: no-repeat;
            }
        </style>
    </head>
</html>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>

<html>
    <head>    
        <title>Students Registration Form</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" 
              crossorigin="anonymous">
    </head>
    <body>       
        <%
            Connection con;
            String msg = "";
            String color = "";
            if (request.getMethod().compareToIgnoreCase("post") == 0) {
                try {
                    String regno = request.getParameter("regno");
                    String name = request.getParameter("name");
                    String address = request.getParameter("address");
                    String course = request.getParameter("course");
                    String phone = request.getParameter("phone");

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/my_project", "root", "");
                    String query = "INSERT INTO students(regno,name,address,course,phone) VALUES (?,?,?,?,?)";
                    PreparedStatement pst = con.prepareStatement(query);

                    pst.setString(1, regno);
                    pst.setString(2, name);
                    pst.setString(3, address);
                    pst.setString(4, course);
                    pst.setString(5, phone);
                    pst.executeUpdate();
                    color = "green";
                    msg = "Student Added Succesfully";
                } catch (Exception ex) {
                    ex.printStackTrace();
                    color = "red";
                    msg = "Error occured make sure your Inputs are correct";
                }
            }
        %>      
        <div class="form-group col-12 p-0">       
            <h4 style="color:<%= color%>"><%= msg%></h4>
        </div>  
        <form id="form" method="post" action="addStudent.jsp" class="form-horizontal">   
            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4">
                    <h2 style="text-align: center">Student Details</h2>
                </div>
            </div>
            <hr/>
            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4 mx-auto">
                    <label>Registration No</label>
                    <input type="text" name="regno" class="form-control" id="regno">
                </div>
            </div>
            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4 mx-auto">
                    <label >Student Name</label>
                    <input type="text" name="name" class="form-control" id="name">
                </div>
            </div>
            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4 mx-auto">
                    <label>Address</label>
                    <input type="text" name="address" class="form-control" id="address">
                </div>
            </div>
            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4 mx-auto">
                    <label>Course</label>
                    <input type="text" name="course" class="form-control" id="course">
                </div>
            </div>

            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4 mx-auto">
                    <label>Phone</label>
                    <input type="text" name="phone" class="form-control" id="phone">
                </div>
            </div>
            <br/>    
            <div class="form-group" align="right">           
                <div class="col-sm-6">
                    <div class="col-sm-2">
                        <Button class="btn btn-success" style="width: 80px;">Submit</Button>
                    </div>
                    <div class="col-sm-4"></div>                  
                </div>
            </div>
        </form>
        <div class="col-sm-12"  align="right">
            <a href="index.jsp"><Button class="btn btn-success" style="width: 80px;">Home</Button></a>
        </div>
    </body>
</html>