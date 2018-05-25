<%@page import="java.sql.ResultSet"%>
<%@page import="db.database"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>InBox</title>
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
.footer{
	background-color:#0b0c10;
	height:80px;
	}
 .icon{
         margin-left: 50%;
        }
        .footicon,
        .footicon:active,
        .footicon:hover{
            margin-top:20px;
            color:#FFF;
            text-decoration: none;
        }
        .copyright,
        .copyright:active,
        .copyright:hover{
            margin-left:45%;
            text-decoration: none;
            margin-top: -10px;
        }
    </style>
</head>
<body>
    
 <nav class="navbar navbar-dark bg-dark">
<a class="navbar-brand" href="index.jsp">
    <span class="glyphicon glyphicon-th-list"></span>
</a>
<ul class="nav navbar-navbar-right">
    <li><a href="logout.jsp" class="color-me"><button type="button" class="btn btn-default btn-md">Log Out</button></a></li>
	  </ul>
</nav>   
     
<div class="container">
    <p class="lead">SEND FILES</p>
        <table class="table">
            <thead class="mdb-color darken-3">
                <tr class="text-dark"> 
                    <th>Reciever name</th>
                    <th>mailid</th>
                    <th>filename</th>
                    <th>actions</th>
                </tr>
             </thead>
          <%
            String Login_id=(String)session.getAttribute("login_id");
            database db=new database();
            int c1=0,c=0;
            String Fname="",lname="",email="",u_id="";
            String b="select * from tbl_file where Login_id='"+Login_id+"'";
            ResultSet rs1=db.exquery(b);
            while(rs1.next()){
             u_id=rs1.getString("User_id");
             String d="select * from tbl_register where User_id='"+u_id+"'"; 
              ResultSet rs2=db.exquery(d);
              while(rs2.next()){
                  Fname=rs2.getString("Fname")+" "+rs2.getString("lname");
                  //lname=rs2.getString("lname");
                  email=rs2.getString("Email");
               }
             %> 
                  <tr>
            <td><%out.println(Fname);%></td>
            <td><%out.println(email);%></td>
            <td><%=rs1.getString("Filename")%></td>
            <td><button type="button" class="btn btn-success" onclick="showDetails('<%=(String)rs1.getString("Filename")%>');">view</button>
            <button type="button" class="btn btn-danger" onclick="showDetailsSort('<%=(String)rs1.getString("Filename")%>');">sort</button></td>
                </tr>
                <%}
%>   
        </table>
                              
</div>
        <div class="container">
            <p class="lead">RECIEVED FILES</p>
            <table class="table">
                <thead class="mdb-color darken-3">
                <tr class="text-dark"> 
                <th>Sender name</th>
                <th>email</th>
                <th>filename</th>
                <th>actions</th>
                </tr>
                </thead>
                <%
           String u_id1="",Fname1="",filename1="",mail="",l_id="";
            String e="select * from tbl_register where Login_id='"+Login_id+"'";
            ResultSet rs11=db.exquery(e);
           while(rs11.next()){
             u_id1=rs11.getString("User_id");
              }
             String f="select * from tbl_file where User_id='"+u_id1+"'"; 
             ResultSet rs22=db.exquery(f);
              while(rs22.next()){
              filename1=rs22.getString("Filename");
              l_id=rs22.getString("Login_id");
              String g="select * from tbl_register where Login_id='"+l_id+"'";
              ResultSet rs33=db.exquery(g);
              while(rs33.next()){
              Fname1=rs33.getString("Fname")+" "+rs33.getString("Lname");
                  //lname=rs2.getString("lname");
             mail=rs33.getString("Email");
              }
             %> 
                <tr>
                   <td><%out.println(Fname1);%></td>
                    <td><%out.println(mail);%></td>
                   <td><%out.println(filename1);%></td>
                    <td><button type="button" class="btn btn-success" onclick="showDetails('<%=rs22.getString("Filename")%>');">view</button>
                    <button type="button" class="btn btn-danger" onclick="showDetailsSort('<%=rs22.getString("Filename")%>');">sort</button></td>
                </tr>
                <%
}
%>  
            </table>
        </div>
            <div class="container-fluid footer">
                            <ul class="icon">
                            <a href="#" class="fa fa-facebook footicon"></a>
                            <a href="#" class="fa fa-twitter footicon"></a>
                            <a href="#" class="fa fa-google footicon"></a>
                            </ul>
                               <div class="row text-center copyright"><a href="http://xyz.com" style="color: #fff;text-decoration: none;"><h6>Copyright © Your Website XCLDUP 2017</h6></a></div>
			</div>
<script type="text/javascript">
function showDetails(filename)
{
   window.location = 'viewdup.jsp?filename='+filename;
}
function showDetailsSort(filename)
{
   window.location = 'sortaction.jsp?filename='+filename;
}
</script>
</body>
</html>
