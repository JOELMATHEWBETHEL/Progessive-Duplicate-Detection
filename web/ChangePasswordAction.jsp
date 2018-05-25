<%-- 
    Document   : ChangePasswordAction
    Created on : Jan 7, 2018, 1:51:45 AM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="db.database"%>
<html>
    <head>
        <title>jhhhjhj</title>
    </head>
    <body>
<%
    database db =new database();
    String login_id=(String)session.getAttribute("login_id");
String oldpswd=request.getParameter("pswd");
String newpswd=request.getParameter("pswdnew");
String confpswd=request.getParameter("confpswd");

//System.out.println(login_id);
String a="select password from tbl_login where login_id='"+login_id+"'";
ResultSet rs= db.exquery(a);
String pswd="";
 int i=0;
 while(rs.next()){
     pswd=rs.getString("password");
 }
 if(newpswd.equals(confpswd)){
     if(pswd.equals(oldpswd)){
         String qry="update tbl_login set password='"+newpswd+"' where login_id='"+login_id+"'"; 
         try{
             i=db.exupdate(qry);
             //out.println(i);
             //out.println(login_id);
         }
         catch(Exception e){
             System.out.println(e);
         }
     }
    
 else{%>
 <script>
    alert("invalid login password");
    window.location="userhome.jsp";
    </script>
<%}
 }
else{
%>
 <script>
 alert("new password and confirm password doesn't match");
 window.location="userhome.jsp";
 </script>
 <%
 }
%>
<script>
 alert("password updated successfully");
 window.location="userhome.jsp";
 </script>
    </body>
</html>
        