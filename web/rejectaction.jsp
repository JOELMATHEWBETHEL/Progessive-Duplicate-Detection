<%-- 
    Document   : rejectaction
    Created on : Dec 24, 2017, 11:41:20 PM
    Author     : user
--%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="db.database"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Rejectaction</title>
        </head>
        <body>

            <% 
                database db=new database();                
                String Login_id=request.getParameter("param2");  
                String qry="update tbl_login set Status='Reject' where login_id='"+Login_id+"'";              
                try{
                   int i=db.exupdate(qry);               
                   }
                catch(Exception e){
                   System.out.println(e);
                   }
               %>

               <script> 
                   alert("Rejected sucessfully");
                   window.location="adminhome.jsp";
               </script>
        </body>
    </html>
