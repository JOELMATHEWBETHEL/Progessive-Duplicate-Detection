<%-- 
    Document   : signupaction
    Created on : Dec 15, 2017, 10:01:30 AM
    Author     : user
--%>

<%@page import="db.database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup action</title>
    </head>
    <body>
        <%
            String fname=request.getParameter("fname");
            String lname=request.getParameter("lname");
            String mailid=request.getParameter("emailid");
            String phoneno=request.getParameter("phoneno");
            String pswd=request.getParameter("password");
            String repswd=request.getParameter("repassword");
            String status="Under Verification";
            
       
      database db=new database();
     String a="insert into tbl_login(username,password,usertype,status) values ('"+mailid+"','"+pswd+"','USER','"+status+"')";
     int loginid=0;
    db.exupdate(a);
    String b="select max(login_id) from tbl_login";
    ResultSet rs=db.exquery(b);
    while(rs.next()){
         loginid=rs.getInt(1);
    }
            
          String q="insert into tbl_register(fname,lname,email,phone,login_id)values('"+fname+"','"+lname+"','"+mailid+"','"+phoneno+"','"+loginid+"')";
         
         int s=db.exupdate(q);
        
        
        
        %>
        <script>
            <% 
         if(s>0){%>
             alert("successfully registered");
             window.location="index.jsp";
         <%}
         else{ %>
          alert("registration unsuccessful");  
          window.location="index.jsp";
         <%}
            %>
        </script>
    </body>
</html>
