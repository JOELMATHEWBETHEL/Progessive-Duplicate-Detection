<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
  <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/glyphicons.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <title>index</title>
<style>
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
	a{
	text-decoration:underline;
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
	 h3{
	padding-top:20px;
	color:#66fcf1;
	font-weight:bolder;
	}
        select{
            width:80%;
            margin-left:200px;
            margin-right:200px;
        }
	.lead{
	padding-top:20px;
	font-size:25px;
	color:#331919;
	font-weight:bolder;
	font-family:Roberto;
        }
        #form1{
            margin-top:30px;
        }
        #slcMail{
            margin-top:-15px;
        }
	.icon{
         margin-left: 50%;
        }
          .click-me{
	width:70%;
	margin-left:200px;
	margin-right:200px;
	margin-bottom:50px;
        margin-top: -10px;
	background-color:#45a29e;
	}
        .footer{
	background-color:#0b0c10;
	height:80px;
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
<a class="navbar-brand" href="#">
<span class="glyphicon glyphicon-th-list"></span>
</a>
<ul class="nav navbar-navbar-right">
      <li><a href="logout.jsp" class="color-me"><button type="button" class="btn btn-default btn-md">Log Out</a></li>
	  </ul>
</nav>
<div id="mycarousel" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <div class="item active">
			<img src="images/pexels-photo-205316.png" alt="" class="img-responsive">
			<div class="carousel-caption">
						<p class="lead"><h1>XCLDUP</h1></p>
						<p class="lead"><h2><center>Get your Way Out Of Duplicate World</center></h2></p>
				
           </div>
        </div>
    </div>
    
</div>
    <h3>
        <center>
            SEND FILE
        </center>
    </h3>
    <form id="form1">
    <div class="input-group mb-5">
        <select class="form-control" id="slcType" name="type">
            <option selected="selected" value="">Select File Type</option>
            <option value="sale">Duplicate</option>
            <option value="purchase">Normal</option>
        </select>
    </div>
        <div class="input-group mb-5">
         <select class="form-control" id="slcMail" name="type">
            <option selected="selected" value="">Select Mailid</option>
            <option value="sale">abc@gmail.com</option>
            <option value="purchase">asd@gmail.com</option>
        </select>
        </div>
         <div class="text-center">
        <button type="submit" class="btn btn-lg btn-default btn-block click-me">Submit</button>
    </div>
    </form>
    <div class="container-fluid footer foot">
    <ul class="icon">
        <a href="#" class="fa fa-facebook footicon"></a>
        <a href="#" class="fa fa-twitter footicon"></a>
        <a href="#" class="fa fa-google footicon"></a>
    </ul>
    <div class="row text-center copyright">
        <a href="http://xyz.com" style="color: #fff;text-decoration: none;">
            <h6>Copyright © Your Website XCLDUP 2017</h6>
        </a>
    </div>
</div>
</body>
</html>