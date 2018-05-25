<%-- 
    Document   : changepassword.jsp
    Created on : Jan 7, 2018, 1:28:57 AM
    Author     : user
--%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Change Password</title>

	<!-- Bootstrap core CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<!--<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">-->
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
			/*padding-top:-25px;
			padding-bottom:-25px;
                        margin-top:-50px;*/
		}
                
                #txtPassword2.error{
                   margin-bottom: -10px;
                }
                #txtPassword1.error{
                    margin-bottom:-10px;
                }
                #txtPassword.error{
                    margin-bottom: -10px;
                }
	body{
	background-position:center;
	background-size:cover;
        width:100%;
        margin-bottom: 100px;
	}
	.col-5{
	height:425px;
	margin-top:200px;
	margin-left:300px;
	background-color:#FFF;
	}
	h3{
	padding-top:20px;
	}
	.form-group{
	margin-left:20px;
	margin-right:20px;
	}
	#textUsrname{
	margin-top:50px;
	}
	h6{
	text-align:center;
	color:#FFF;
	font-family:Times New Roman;
	padding-top:10px;
	}
	a{
	text-decoration:underline;
	}
	#txtPassword2
	{
	margin-bottom:20px;
	}
	</style>
</head>
<body background="images/pexels-photo-186461.jpeg" alt="" class="img-responsive">
	<div class="container">
		<div class="row-justify-content-center">
			<div class="col-5">
				<h3><center>CHANGE PASSWORD</center>
			<br>
			                <form id="form" action="ChangePasswordAction.jsp" method="get">
				<div class="form-group has-feedback">
					<input type="password" class="form-control" id="txtPassword" name="pswd" placeholder="Old password">
		            </div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" id="txtPassword1" name="pswdnew" placeholder="New password">
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" id="txtPassword2" name="confpswd" placeholder="Confirm password">
				</div>
               <div class="text-center"><button type="submit" class="btn btn-primary btn-lg btn-block">CHANGE</button></div>
							</form>
                        </div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script type="text/javascript">
		$(document).ready(function(){
			$('#form').validate({
				rules:{
					pswd:{
						required: true
					},
					pswdnew:{
						required: true,
                                                minlength:6
					},
                                        confpswd:{
                                            required:true,
                                            equalTo:"#txtPassword1"
                                        }
				},
				messages:{
					pswd:{
						required:"Please enter your existing password"
					},
					pswdnew:{
						required:"Please enter your new password",
                                                minlength:6
					},
                                        confpswd:{
                                            required:"Please re-enter your new password",
                                            equalTo:"Password mismatch"
                                        }
				}
			});
		});
    </script>	
</body>
</html>