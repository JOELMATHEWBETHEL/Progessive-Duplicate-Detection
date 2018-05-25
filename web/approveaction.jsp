<%-- 
    Document   : approveaction
    Created on : Dec 21, 2017, 11:36:40 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="db.database"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Approveaction</title>
        </head>
        <body>
                <%               
                        database db=new database();
                        String Login_id=request.getParameter("param1");
                        String qry="update tbl_login set status='APPROVED' where login_id='"+Login_id+"'";              
                        try{
                        int i=db.exupdate(qry);                       
                        }
                        catch(Exception e){
                        System.out.println(e);
                        }           
                %>

               <script> 
                  alert("Approve sucessfully");
                  window.location="adminhome.jsp";        
               </script>

        </body>
    </html>
