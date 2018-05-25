<%@page import="db.database"%>
<%@page import="java.sql.ResultSet"%>
<% 
    String uname =request.getParameter("name");
    String pass=request.getParameter("pswd");
    String a="select * from tbl_login where Username='"+uname+"' and Password='"+pass+"'";
    database db =new database();
    ResultSet rs= db.exquery(a);
    String loginid="",usertype="",status="";
    
    while(rs.next())
       
    {
        loginid =rs.getString("Login_id");
        usertype=rs.getString("Usertype");
        status=rs.getString("Status");
    }
    session.setAttribute("login_id", loginid);
    String b="select User_id from tbl_register where Login_id='"+loginid+"'";
    ResultSet rs1= db.exquery(b);
    String userid="";
    while(rs1.next())
       
    {
        userid=rs1.getString("User_id");
    }
     session.setAttribute("user_id", userid);
    if(usertype.equals("ADMIN"))
    {
        response.sendRedirect("adminhome.jsp");
    }
    else if(usertype.equals("USER") && status.equals("APPROVED"))
    {
        response.sendRedirect("userhome.jsp");
    }
   
    else
    {
    
    %>
    <script>
        alert("invalid user");
        window.location="index.jsp";
    </script>
    <%
    }
    %>
