<%@page import="db.database"%>
<%@page import="java.sql.ResultSet"%>
<%
 session.invalidate();
 response.sendRedirect("index.jsp");
    %>