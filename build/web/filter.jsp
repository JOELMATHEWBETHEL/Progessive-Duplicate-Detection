<%@page import="java.util.Iterator"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.WorkbookFactory"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="java.io.FileInputStream"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
  <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/glyphicons.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <title>Filter files</title>
<style>
    input.error, textarea.error, select.error{
			border-color: #ebccd1;
			background-color: #f2dede;
			color: #a94442;
		}
		input:focus.error, textarea:focus.error, select:focus.error{
			border-color: #ebccd1;
			box-shadow:0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(242, 222, 222, 0.6);
		}
		label.error {
			color: #a94442;
			font-size:10px;
			padding-top:.5px;
			padding-bottom:.5px;
		}
img{
height:600px;
width:100%;
}
nav{
height:60px;
}
button{
background-color:#1f2833;
color:#c5c6c7;
}
.color-me,
.color-me:hover{
color:#c5c6c7;
text-decoration:none;
}
h3{
	padding-top:20px;
	color:#66fcf1;
	font-weight:bolder;
	}
        
	.form-group{
            width: 85%;
	margin-left:100px;
	margin-right:100px;
	}
        
	#textUsrname{
	margin-top:30px;
	}
	a{
	text-decoration:underline;
	}
	.click-me{
	width:85%;
	margin-left:100px;
	margin-right:100px;
	margin-bottom:50px;
	background-color:#45a29e;
	}
	.footer{
	background-color:#0b0c10;
	height:80px;
	}
	.carousel-caption {
    top: 75px;
    bottom: auto;
}
	h1{
	padding-left:100px;
	color:#66fcf1;
	font-size:100px;
	}
	h2{
	font-weight:bold;
	color:#45a29e;
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
    <%
        String fname=request.getParameter("filename");
        FileInputStream ExcelFileToRead = new FileInputStream("C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/"+fname);
             Workbook wb1=WorkbookFactory.create(ExcelFileToRead);
        Sheet sh=wb1.getSheet("Sheet1");
        XSSFCell cell;
        int noOfColumns = sh.getRow(0).getLastCellNum();
        Row c=sh.getRow(0);
        Iterator cells = c.cellIterator();
        %>
<nav class="navbar navbar-dark bg-dark">
<a class="navbar-brand" href="index.jsp">
<span class="glyphicon glyphicon-th-list"></span>
</a>
<ul class="nav navbar-navbar-right">
      <li><a href="logout.jsp" class="color-me"><button type="button" class="btn btn-default btn-md">LogOut</a></li>
	  </ul>
</nav>
<div id="mycarousel" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <div class="item active">
			<img src="images/macbook-apple-imac-computer-39284.jpeg" alt="" class="img-responsive">
			<div class="carousel-caption">
						<p class="lead"><h1>EXCLDUP</h1></p>
						<p class="lead"><h2><center>Get your Way Out Of Duplicate World</center></h2></p>
				
           </div>
        </div>
    </div>
</div>
	<div class="container-fluid">
				<h3><center>FILTER FILE</center></h3>
                                <form id="form" action="filteraction.jsp" method="get">
				<div class="form-group">
					<!--<label for="textUsrname">Username</label>-->
                                        <select class="custom-select" id="inputGroupSelect04" name="key">
                                                <option selected>Choose...</option>
                                                <%while (cells.hasNext())
			{
				cell=(XSSFCell) cells.next();
                                %>
                                                <option value="<%=cell.getStringCellValue()%>"><%=cell.getStringCellValue()%></option>
                                                <%
                                                        }
                                                 %>
                                              </select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="textFvalue" name="value" placeholder="Filter value">
				</div>
				<div class="text-center"><button type="filter" class="btn btn-lg btn-default btn-block click-me">Filter</button></div>
                                </form>
                        </div>
			<div class="container-fluid footer">
                            <ul class="icon">
                            <a href="#" class="fa fa-facebook footicon"></a>
                            <a href="#" class="fa fa-twitter footicon"></a>
                            <a href="#" class="fa fa-google footicon"></a>
                            </ul>
                               <div class="row text-center copyright"><a href="http://xyz.com" style="color: #fff;text-decoration: none;"><h6>Copyright © Your Website XCLDUP 2017</h6></a></div>
			</div>
    <script src="js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script type="text/javascript">
		$(document).ready(function(){
			$('#form').validate({
				rules:{
					key:{
						required: true
					},
					value:{
						required: true
					}
				},
				messages:{
					key:{
						required:"Please enter filter key"
					},
                                        value:{
						required:"Please enter filter value"
					}
				}
			});
		});
    </script>	
</body>
</html>
