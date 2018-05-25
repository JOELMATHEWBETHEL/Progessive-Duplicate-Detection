<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.WorkbookFactory"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.database"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>VIEW DUP</title>
    <link href="css/glyphicons.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        nav{
height:60px;
}
.inbox,
.inbox:hover{
    color:#c5c6c7;
    font-family: "Roberto";
    font-weight: bolder;
    font-size: 25px;
    padding: 0;
border: none;
background: none;
padding-left: 20px;
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
table{
    margin-top: 20px;
}
.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
   background-color: #ffcb9a;
}
.card{
            height:200px;
	margin-left:40px;
	margin-top:50px;
        margin-bottom: 50px;
	background-color:#ab3334;
	}
	.lead{
	padding-top:20px;
	font-size:25px;
	color:#331919;
	font-weight:bolder;
	font-family:Roberto;
	}
	.user1{
	font-size:50px;
	text-align:center;
	color:#e8d1a4;
	padding-top:20px;
	}
        .row{
            margin-left: 100px;
        }
	.to-center{
	margin-top:-10px;
	}
        .card-link,
        .card-link:active,
        .card-link:hover{
            text-decoration: none;
            color:#331919;
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
        .footer{
	background-color:#0b0c10;
	height:80px;
	}
    </style>
</head>
<body>
    <nav class="navbar navbar-dark bg-dark">
        
<ul class="nav navbar-navbar-left">     
    <li class="navbar-left">
<a class="navbar-brand" href="index.jsp">
    <span class="glyphicon glyphicon-th-list"></span>
</a>
</li>
<li class="navbar-left"><a href="viewhistory.jsp" class="color-me">
        <button type="button" class="btn btn-default btn-md">Inbox</button>
    </a></li>
</ul>
<ul class="nav navbar-navbar-right">
    <li><a href="logout.jsp" class="inbox"><button type="button" class="btn btn-default btn-md">Log Out</button></a></li>
	  </ul>
        </nav>
        <div class="container">
            <%
                String fname=request.getParameter("filename");
                String fileid=request.getParameter("fileid");
                String fpath="C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/"+fname;
                session.setAttribute("fname", fname);
                String re_count=String.valueOf(application.getAttribute("count"));
                int count=Integer.parseInt(re_count);
            FileInputStream ExcelFileToRead = new FileInputStream("C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/"+fname);
             Workbook wb1=WorkbookFactory.create(ExcelFileToRead);
        Sheet sh=wb1.getSheet("Sheet1");
        int rowno=sh.getLastRowNum();
        XSSFCell cell;
        int noOfColumns = sh.getRow(0).getLastCellNum();
        Row c=sh.getRow(0);
        Iterator cells = c.cellIterator();
            %>
            <table class="table table-striped">
                <thead class="bg-danger">
                    <tr>
                    <%
                    while (cells.hasNext())
			{
				cell=(XSSFCell) cells.next();
                    %>
                    
                        <th scope="col"><%=cell.getStringCellValue()%></th>
                    <%
                        }
                    %>
                    </tr>
                </thead>
               <% for(int i=1;i<=rowno;++i)
        {
            %>
                <tr>
                   <% Row c1=sh.getRow(i);
                   Iterator cells1 = c1.cellIterator();
        while (cells1.hasNext())
			{
				cell=(XSSFCell) cells1.next();%>
                                <td><%=cell.getStringCellValue()%></td>
                                <%}
        %>
                </tr>
                <%
        }
                %>
            </table>
        </div>
                <%
                String fileName="C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/"+fname+".xlsx";
                File f = new File(fileName);
        if (f.exists()) 
         {
               f.delete();
               database db=new database();
               int fileid1=Integer.parseInt(fileid);
               String ftype="";
               fileid1=fileid1+count;
               String a="select Filetype from tbl_file where File_id='"+fileid1+"'";
               ResultSet rs1=db.exquery(a);
               while(rs1.next()){
                   ftype=rs1.getString("Filetype");
               }
               if(ftype.equals(".xlsx.xlsx")){
               String b="delete from tbl_file where File_id='"+fileid1+"'";
               int x=db.exupdate(b);
               }
          } 
               %>
<div class="row">
     <div class="card col-md-3">
        <span class="card-img-top glyphicon glyphicon-search user1" alt="Card image cap"></span>
        <div class="card-block">
            <h4 class="card-title"><p class="lead"><center class="lead to-center"><a href="checkdup.jsp" class="card-link">CHECK DUP</a></center></p></h4>
        </div>
     </div>
        <div class="card col-md-3">
        <span class="card-img-top glyphicon glyphicon-zoom-out user1" alt="Card image cap"></span>
        <div class="card-block">
            <h4 class="card-title"><p class="lead"><center class="lead to-center"><a href=<%="filter.jsp?filename="+fname%> class="card-link">FILTER</a></center></p></h4>
        </div>
        </div>
        <div class="card col-md-3">
        <span class="card-img-top glyphicon glyphicon-edit user1" alt="Card image cap"></span>
        <div class="card-block">
            <h4 class="card-title"><p class="lead"><center class="lead to-center"><a href=<%="sortaction.jsp?filename="+fname%> class="card-link">SORT</a></center></h4>
        </div>
    </div>
    <div class="card col-md-3">
        <span class="card-img-top glyphicon glyphicon-edit user1" alt="Card image cap"></span>
        <div class="card-block">
            <h4 class="card-title"><p class="lead"><center class="lead to-center"><a href=<%="download.jsp?filepath="+fpath%> class="card-link">DOWNLOAD</a></center></h4>
        </div>
    </div>
</div>
    <div class="container-fluid footer">
                            <ul class="icon">
                            <a href="#" class="fa fa-facebook footicon"></a>
                            <a href="#" class="fa fa-twitter footicon"></a>
                            <a href="#" class="fa fa-google footicon"></a>
                            </ul>
                               <div class="row text-center copyright"><a href="http://xyz.com" style="color: #fff;text-decoration: none;"><h6>Copyright © Your Website XCLDUP 2018</h6></a></div>
			</div>
</body>
</html>