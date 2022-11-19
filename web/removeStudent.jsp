<%-- 
    Document   : removeStudent
    Created on : Oct 11, 2022, 4:21:05 PM
    Author     : Mihreteab
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%            
    Connection con;    
    String regno = request.getParameter("id");
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/my_project","root","");
    String query = "delete from  students where regno = ?";
    PreparedStatement pst = con.prepareStatement(query);
    pst.setString(1, regno);
    pst.executeUpdate();
%>      
    <script>  
          window.location.replace("viewStudent.jsp");              
    </script>