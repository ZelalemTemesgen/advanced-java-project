<%-- 
    Document   : viewTeacher
    Created on : Oct 11, 2022, 4:30:26 PM
    Author     : Mihreteab
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Teacher</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" 
      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>  
<div class="form-group">
    <div  class="col-sm-4"></div>
        <div  class="col-sm-4">
            <h2 style="text-align: center">Teacher Details</h2>
        </div>
</div>
    <div class="col-sm-2">
        <a href="index.jsp"><Button class="btn btn-success" style="width: 80px;">Home</Button></a>
    </div>
    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">Reg No</th>
                <th scope="col">Name</th>
                <th scope="col">Subject</th>
                <th scope="col">Address</th>
                <th scope="col">Phone</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection con;
                PreparedStatement pst;
                ResultSet rs;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/my_project","root","");
                String query = "Select * from teacher";
                pst = con.prepareStatement(query);
                rs = pst.executeQuery();
                while(rs.next()){
            %>
            <tr>
            <th scope="row"><%= rs.getString("regno") %></th>
            <td><%=rs.getString("teachername")%></td>
            <td><%=rs.getString("subject")%></td>
            <td><%=rs.getString("address")%></td>
            <td><%=rs.getString("phone")%></td>
            <td><a class="btn btn-success" href="editTeacher.jsp?id=<%=rs.getString("regno") %>" role="button">Edit</a><a class="btn btn-danger" href="removeTeacher.jsp?id=<%=rs.getString("regno") %>" role="button">Remove</a></td>
            </tr>
                      <% }%>
 
        </tbody>
    </table>
  </body>
</html>