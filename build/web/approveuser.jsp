<%@page import="java.sql.ResultSet"%>
<%@page import="db.database"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Table</title>
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
<nav class="navbar navbar-dark bg-dark">
<a class="navbar-brand" href="#">
<span class="glyphicon glyphicon-th-list"></span>
</a>
<ul class="nav navbar-navbar-right">
      <li><a href="logout.jsp" class="color-me"><button type="button" class="btn btn-default btn-md">Log Out</a></li>
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
                    <th>actions</th>
                </tr>
             </thead>
             <%

                  database db=new database();
                  int c=0;
                  String query1="select * from tbl_login l inner join tbl_register r on l.Login_id=r.Login_id where l.Status='Under Verification'";
                  ResultSet rs=db.exquery(query1);
                  while(rs.next()){
                    
                      c++;
                %>      
        <tr >
            <th scope="row"><%out.println(c);%></th>
            <td> <%=rs.getString("Fname")%></td>
            <td><%=rs.getString("Lname")%></td>
            <td><%=rs.getString("Email")%></td>
            <td><%=rs.getString("Phone")%></td>
            <td>
                <form name="submitToapprove" action="approveaction.jsp">
                     <input type="hidden" name="param1"/>
                </form>
                <form name="submitToreject" action="rejectaction.jsp">
                     <input type="hidden" name="param2"/>
                </form>
               <button type="submit" class="btn btn-success" value="approve" onclick="doApprove(<%=rs.getString("Login_id")%>);">approve</button>
                              <button type="button" class="btn btn-danger" onclick="doReject(<%=rs.getString("Login_id")%>);">Reject</button>
                        </td>
            
            </div>
    </tr>
                <% 
                        }
                %>
</table>
</div>

<script type="text/javascript">
 function doApprove(value) {
    var form = document.forms['submitToapprove'];
   form.elements['param1'].value=value;
   form.submit();
 }  
 function doReject(value) {
    var form = document.forms['submitToreject'];
   form.elements['param2'].value=value;
   form.submit();
 }        
</script>
</body>

<!-- Mirrored from premiumlayers.net/demo/html/expresslogistics/about.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 22 Nov 2017 10:58:26 GMT -->
</html>