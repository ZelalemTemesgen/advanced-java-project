<%-- 
    Document   : EditStudent
    Created on : Oct 11, 2022, 4:12:14 PM
    Author     : Mihreteab
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <title>Teachers Registration Form</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" 
      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
<body>
  
    <%           
        Connection con;    
        String msg = "";
        String color = "";
 
        if(request.getMethod().compareToIgnoreCase("post")==0)
           {
                try
                {
                   String regno = request.getParameter("regno");
                   String teachername = request.getParameter("teachername");
                   String subject = request.getParameter("subject");
                   String address = request.getParameter("address");
                   String phone = request.getParameter("phone");

                   Class.forName("com.mysql.jdbc.Driver");
                   con = DriverManager.getConnection("jdbc:mysql://localhost/my_project","root","");
                   String query = "update teacher set teachername = ?, address= ?, subject =? ,phone= ? where regno = ?";

                   PreparedStatement pst = con.prepareStatement(query);

                   pst.setString(1, teachername);
                   pst.setString(2, subject);
                   pst.setString(3, address);
                   pst.setString(4, phone);
                   pst.setString(5, regno);
                   pst.executeUpdate();

                   color = "green";
                   msg = "Teacher Information Updated Succesfully";


                }catch(Exception ex){
                ex.printStackTrace();
                color = "red";
                msg = "Error occured make sure your Inputs are correct";
                }
            }
    %>      
<div class="form-group col-12 p-0">      
<h4 style="color:<%= color %>"><%= msg %></h4>
</div>       
    <form id="form" method="post" action="editTeacher.jsp" class="form-horizontal">      
        <%
            PreparedStatement pst;
            ResultSet rs;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/my_project","root","");                
            String id = request.getParameter("id");                         
            pst = con.prepareStatement("select * from teacher where regno = ?");
            pst.setString(1, id);
            rs = pst.executeQuery();                            
            while(rs.next())
                {                    
        %>  
<div class="form-group">
    <div  class="col-sm-4"></div>
        <div  class="col-sm-4">
            <h2 style="text-align: center">Teacher's Details</h2>
    </div>
</div>
        <hr/>
<div class="form-group">
    <div  class="col-sm-4"></div>
        <div  class="col-sm-4 mx-auto">
            <label>Registration No</label>
            <input type="text" name="regno" class="form-control" id="regno" value="<%= rs.getString("regno") %>">
        </div>
</div>
<div class="form-group">
    <div  class="col-sm-4"></div>
        <div  class="col-sm-4 mx-auto">
            <label >Teacher Name</label>
            <input type="text" name="teachername" class="form-control" id="teachername"  value="<%= rs.getString("teachername") %>">
        </div>
</div>
<div class="form-group">
    <div  class="col-sm-4"></div>
        <div  class="col-sm-4 mx-auto">
            <label>Subject</label>
            <input type="text" name="subject" class="form-control" id="subject" value="<%= rs.getString("subject") %>">
        </div>
</div>
<div class="form-group">
    <div  class="col-sm-4"></div>
        <div  class="col-sm-4 mx-auto">
            <label>Address</label>
            <input type="text" name="address" class="form-control" id="address" value="<%= rs.getString("address") %>">
        </div>
</div>
            
<div class="form-group">
    <div  class="col-sm-4"></div>
        <div  class="col-sm-4 mx-auto">
            <label>Phone</label>
            <input type="text" name="phone" class="form-control" id="phone" value="<%= rs.getString("phone") %>">
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
             <% } %> <!<!-- end of while loop -->
    </form>
<div class="col-sm-12"  align="right">
    <a href="index.jsp"><Button class="btn btn-success" style="width: 80px;">Home</Button></a>
</div>
     </body>
</html>