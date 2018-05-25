<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
  <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/glyphicons.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <title>userHome</title>
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
h3{
	padding-top:20px;
	color:#66fcf1;
	font-weight:bolder;
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
			<img src="images/pexels-photo-204611.jpeg" alt="" class="img-responsive">
			<div class="carousel-caption">
						<p class="lead"><h1>XCLDUP</h1></p>
						<p class="lead"><h2><center>Get your Way Out Of Duplicate World</center></h2></p>
				
           </div>
        </div>
    </div>
</div>
<div class="row">
     <div class="card col-md-3">
        <span class="card-img-top glyphicon glyphicon-eye-open user1" alt="Card image cap"></span>
        <div class="card-block">
            <h4 class="card-title"><p class="lead"><center class="lead to-center"><a href="" class="card-link">VIEW USER</a></center></p></h4>
        </div>
    </div>
    <div class="card col-md-3">
        <span class="card-img-top glyphicon glyphicon-download user1" alt="Card image cap"></span>
        <div class="card-block">
            <h4 class="card-title"><p class="lead"><center class="lead to-center"><a href="viewnewfiles.jsp" class="card-link">RECIEVE FILE</a></center></p></h4>
         </div>
    </div>
    <div class="card col-md-3">
        <span class="card-img-top glyphicon glyphicon-upload user1" alt="Card image cap"></span>
        <div class="card-block">
            <h4 class="card-title"><p class="lead"><center class="lead to-center"><a href="browse.jsp" class="card-link">SEND FILE</a></center></p></h4>
        </div>
    </div>
   
</div>
<div class="row">
     <div class="card col-md-3">
        <span class="card-img-top glyphicon glyphicon-folder-open user1" alt="Card image cap"></span>
        <div class="card-block">
            <h4 class="card-title"><p class="lead"><center class="lead to-center"><a href="viewhistory.jsp" class="card-link">VIEW HISTORY</a></center></p></h4>
        </div>
    </div>
    <div class="card col-md-3">
        <span class="card-img-top glyphicon glyphicon-refresh user1" alt="Card image cap"></span>
        <div class="card-block">
            <h4 class="card-title"><p class="lead"><center class="lead to-center"><a href="changepassword.jsp" class="card-link">CHANGE PASSWORD</a></center></p></h4>
        </div>
    </div>
   <div class="card col-md-3">
        <span class="card-img-top glyphicon glyphicon-zoom-in user1" alt="Card image cap"></span>
        <div class="card-block">
            <h4 class="card-title"><p class="lead"><center class="lead to-center"><a href="compare.jsp" class="card-link">CHECK FILES</a></center></p></h4>
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
