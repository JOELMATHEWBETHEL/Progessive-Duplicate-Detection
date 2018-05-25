<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
  <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/glyphicons.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <title>compare files</title>
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
        input{
            margin-left: 20px;
        }
	.form-group{
	/*margin-left:100px;
	margin-right:100px;
        */
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
        margin-top: 25px;
	background-color:#45a29e;
	}
        .click-me1{
	width:40%;
	margin-left:100px;
        margin-bottom: 0px;
	margin-top:20px;
	background-color:#45a29e;
        color:#fff;
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
				<h3><center>COMPARE FILE</center></h3>
                                <form id="form" action="simcheck.jsp" method="get">
				 
        <div class="form-group">
            <label class="btn btn-lg btn-default click-me1" for="exampleFormControlFile1">
    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="file1" accept=".xlsx" style="display:none;" onchange="$('#upload-file-info').html(this.files[0].name);">
    File 1</label>
            <span class='label label-info' id="upload-file-info"></span>
  </div>
                               
                                     
        <div class="form-group">
             <label class="btn btn-lg btn-default click-me1" for="exampleFormControlFile2"><!--
    --><input type="file" class="form-control-file" id="exampleFormControlFile2" name="file2" accept=".xlsx" style="display:none;" onchange="$('#upload-file1-info').html(this.files[0].name);">
    File 2</label>
            <span class='label label-info' id="upload-file1-info"></span>
        </div>
                                   
				<div class="text-center"><button type="compare" class="btn btn-lg btn-default btn-block click-me">Compare</button></div>
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
                                        file1:{
						required: true
					},
					file2:{
						required: true
					}
				},
				messages:{
					file1:{
						required:"Please insert the first file"
					},
                                        file2:{
						required:"Please insert the second file"
					}
				}
			});
		});
    </script>	
</body>
</html>