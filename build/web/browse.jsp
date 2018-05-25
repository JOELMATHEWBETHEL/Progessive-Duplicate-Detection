<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
  <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/glyphicons.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <title>Browse File</title>
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
			font-size:15px;
                        font-family: Roberto;
                        margin-top: 30px;
                        text-align: left;
		}
    body{
	margin-bottom:0px;
        width:100%;
        background-position: center;
        background-size: cover;
	}
        img{
height:600px;
width:100%;
}
label{
    margin-top:20px;
    margin-left: 500px;
}
.color-me,
.color-me:hover{
color:#c5c6c7;
text-decoration:none;
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
        #sendmail{
            width:80%;
            margin-left:150px;
            margin-right:150px;
            margin-top: 20px;
            margin-bottom: -35px;
        }
        select{
            margin-left: 200px;
            margin-right: 200px;
            margin-top: 20px;
        }
        h3{
	padding-top:20px;
	color:#66fcf1;
	font-weight:bolder;
	}
        .click-me{
	/*width:85%;*/
	margin-left:150px;
	/*margin-right:150px;*/
	margin-bottom:50px;
        margin-top: -10px;
	background-color:#45a29e;
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
    <a class="navbar-brand" href="userhome.jsp">
        <span class="glyphicon glyphicon-th-list"></span>
    </a>
    <ul class="nav navbar-navbar-right">
        <li><a href="" class="color-me"><button type="button" class="btn btn-default btn-md">Log Out</a></li>
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
<h3><center>SELECT FILE</center></h3>
<form name="form1" id ="form" method="post" enctype="multipart/form-data" action="upload.jsp">
    <div id="add-more">
    <div class="form-group mb-5">
        <input type="text" class="form-control" name="sendTo" id="sendmail" placeholder="Recipent mail">
    </div>
    </div>
    <div class="col md-5">
        <div class="form-group md-5">
            <label class="custom-file">
                <input type="file" id="inputGroupFile01" name="filename" class="custom-file-input" required>
                    <span class="custom-file-control"></span>
            </label>
        </div>
    </div>
    <div class="input-group mb-5">
        <select class="form-control" id="slcType" name="type">
            <option selected="selected" value="">Select File Type</option>
            <option value="duplicate file">Duplicate</option>
            <option value="normal file">Normal</option>
            <option value="virus file">Virus affected</option>
        </select>
    </div>
    <div class="text-center">
        <button type="button" id="more_fields" onclick="add_fields();" class="btn btn-primary click-me">Add</button>
        <button type="submit" class="btn btn-primary click-me">Submit</button>
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
    <script src="js/jquery.min.js"></script>
     <script src="js/jquery.validate.js"></script>
        <script type="text/javascript">
            var recipent_count = 1;
function add_fields() {
    recipent_count++;
    var objTo = document.getElementById('add-more');
    var divtest = document.createElement("div");
    divtest.innerHTML = '<div class="form-group mb-5"><input type="text" class="form-control" name="sendTo" id="sendmail" placeholder="Recipent mail'+recipent_count+'"></div>';
    
    objTo.appendChild(divtest);
}
		$(document).ready(function(){
                    jQuery.validator.addMethod("lettersonly", function(value, element) {
return this.optional(element) || /^[a-z\s]+$/i.test(value);
}, "Only alphabetical characters");
			$('#form').validate({
				rules:{
					filename:{
						required: true
					},
                                        type:{
                                            required: true
                                        },
                                        sendTo:{
                                            required: true,
                                            email: true
                                        }
				},
				messages:{
					filename:{
						required:"Please enter your file name"
					},
                                        type:{
                                          required:"Please enter your file type"
                                        },
                                        sendTo:{
                                            required:"Please enter your email",
                                            email:"Please enter valid email"
                                        }
				}
			});
		});
    </script>	    
</body>
</html>