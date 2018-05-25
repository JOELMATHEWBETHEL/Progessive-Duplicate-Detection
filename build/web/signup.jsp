<%-- 
    Document   : signup
    Created on : Dec 15, 2017, 9:24:59 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>SignUp</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
	<style>
        /* http://meyerweb.com/eric/tools/css/reset/ 
        v2.0 | 20110126
        License: none (public domain)
*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}
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
			padding-top:.5px;
			padding-bottom:.5px;
                        font-family: Roberto;
		}
	body{
	/*background-color:#1D2F3E;*/
	margin-bottom:100px;
        width:100%;
         background-position: center;
  background-size: cover;
	}
	h1{
       font-size:25px;
	color:#FFF;
        font-family:Roberto;
	padding-top:10px;
	margin-bottom:30px;
	}
	.col-5{
	background-color:#152737;
	height:600px;
	margin-top:100px;
	margin-left:300px;
	}
	p{
	color:#FFF;
	margin-top:-30px;
	text-align:center;
	}
	.btn-dark,
	.btn-dark:hover,
	.btn-dark:active,
	.btn-dark:visited,
	.btn-dark:focus {
	background-color:#1D2F3E;
	}
	</style>
</head>
<body background="images/pexels-photo-186461.jpeg" alt="" class="img-responsive">
<div class="container">
     
		<div class="row-justify-content-center">
			<div class="col-5">
				<h1><center>SIGN UP</center></h1>
                                <form id="form" action="signupaction.jsp" method="post">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="fname"id="txtFname" placeholder="FirstName">
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control"name="lname" id="txtLname" placeholder="LastName">
				</div>
				<div class="form-group has-feedback">
					<input type="email" class="form-control"name="emailid" id="mailid" placeholder="Email">
				</div>
				<div class="form-group has-feedback">
					<input type="phone" class="form-control" name="phoneno" id="txtphone" placeholder="Phone">
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" name="password" id="txtpassword" placeholder="Password">
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" name="repassword" id="repassword" placeholder="Confirm Password">
				</div>
                                    <center>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
                                         <label class="form-check-label" for="exampleCheck1"><p>by clicking up,I agree to your terms</p></label>
                                    </div>
                                    </center>	
				<button type="submit" class="btn btn-dark btn-lg btn-block">Sign Up</button>
                                </form>
<script src="js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script type="text/javascript">
		$(document).ready(function(){
                    jQuery.validator.addMethod("lettersonly", function(value, element) {
return this.optional(element) || /^[a-z\s]+$/i.test(value);
}, "Only alphabetical characters");
			$('#form').validate({
				rules:{
					fname:{
						required: true,
                                                lettersonly: true
					},
                                        lname:{
                                            required: true,
                                            lettersonly: true
                                        },
                                        emailid:{
                                            required: true,
                                            email: true
                                        },
                                        phoneno:{
                                            required: true,
                                              digits: true,
                                            minlength: 10,
                                            maxlength: 12
                                          },
                                        password:{
                                            required: true,
                                            minlength: 6
                                        },
					repassword:{
						required: true,
                                                equalTo: "#txtpassword"
					}
				},
				messages:{
					fname:{
						required:"Please enter your first name",
                                                lettersonly:"Name should only consist of letters"
					},
                                        lname:{
                                          required:"Please enter your last name",
                                          lettersonly:"Name should only consist of letters"
                                        },
                                        emailid:{
                                            required:"Please enter your email",
                                            email:"Please enter valid email"
                                        },
                                        phoneno:{
                                            required:"Please enter your phone number",
                                            digits:"phone no consist of only digits",
                                            minlength:"Phone number should be atleast 10 digits",
                                            maxlength:"Phone number should be atmost 12 digits"
                                            
                                        },
                                        password:{
                                            required:"Please enter your password",
                                            minlength:"password should be atleast 6 characters"
                                        },
					repassword:{
						required:"Please re-enter your password",
                                                equalTo:"Password mismatch"
					}
				}
			});
		});
    </script>	
</body>
</html>