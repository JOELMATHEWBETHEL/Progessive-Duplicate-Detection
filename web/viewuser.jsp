<%@page import="java.sql.ResultSet"%>
<%@page import="db.database"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Approve User</title>
    <link href="css/glyphicons.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        nav{
height:60px;
}
.color-me,
.color-me:hover{
color:#c5c6c7;
text-decoration:none;
}
button{
background-color:#1f2833;
color:#c5c6c7;
}
    </style>
</head>
<body>
    <%

                  database db=new database();
                  String login_id=(String)session.getAttribute("login_id");   
                  int c=0,i=1;
                  String q="select count(*) as c from tbl_register where login_id!='"+login_id+"'";
                  ResultSet rs=db.exquery(q);
                  while(rs.next())
                  {
                  c=rs.getInt("c");
                  }
                  if(c>0)
                  {

                      
         %>    
 <nav class="navbar navbar-dark bg-dark">
<a class="navbar-brand" href="index.jsp">
    <span class="glyphicon glyphicon-th-list"></span>
</a>
<ul class="nav navbar-navbar-right">
      <li><a href="#" class="color-me"><button type="button" class="btn btn-default btn-md">Log Out</a></li>
	  </ul>
</nav>        
<div class="container">
        <table class="table">
            <thead class="mdb-color darken-3">
                <tr class="text-dark">  
                   <th>#</th>
                    <th>fname</th>
                    <th>lname</th>
                    <th>mailid</th>
                    <th>phone</th>
                </tr>
             </thead>
             <%
                        
                       
                        String s="select * from tbl_register where login_id!='"+login_id+"'";
                        ResultSet rs1=db.exquery(s);
                        while(rs1.next()){   
                            

                %>  
                  <tr>
           <td><%out.println(i);%></td>
            <td> <%=rs1.getString("fname")%></td>
            <td><%=rs1.getString("lname")%></td>
            <td><%=rs1.getString("email")%></td>
            <td><%=rs1.getString("phone")%></td>
                </tr>
               <%
                            i++;
                  }
                  %>     
        </table>
                              
</div>

          <%
    }
%>   
</body>
</html>