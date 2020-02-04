<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login page for charity web</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery ka plugin -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" media="all" rel="stylesheet" type="text/css" />
<!-- Custom Theme files -->
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />

<script type="application/x-javascript">
	
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);
            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        
</script>

</head>
<body>
	<!---->
	<div class="header">
		<div class="container">
			<div class="header-top">
				<div class="logo">
					<a href="index_donator.html">
						<h1>
							Donate <span>charity</span>
						</h1>
					</a>
				</div>

				<div class="clearfix"></div>

			</div>
			<div class="top-menu">
				<span class="menu">MENU</span>
				<ul>
					<li><a href="index_donator.html"> <span aria-hidden="true"
							class="glyphicon glyphicon-home"></span>Home
					</a></li>
					<li><a href="profile_donator.html"> <span
							aria-hidden="true" class="glyphicon glyphicon-leaf"></span>profile
					</a></li>
					<li class="active"><a href="login_donator.html"> <span
							aria-hidden="true" class="glyphicon glyphicon-user"></span>login
					</a></li>
					<li><a href="signup_donator.html"> <span
							aria-hidden="true" class="glyphicon glyphicon-th"></span>signup
					</a></li>
					<li><a href="contact_donator.html"> <span
							aria-hidden="true" class="glyphicon glyphicon-envelope"></span>Contact
					</a></li>
				</ul>
			</div>
			<script>
				$("span.menu").click(function() {
					$(".top-menu ul").slideToggle("slow", function() {
					});
				});
			</script>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="contact">
		<div class="container"></div>
		<div class="contact-form">
			<div class="container">
				<h3 class="hdng">login</h3>

			</div>
		</div>
	</div>
	<div style="align-text: center">
		<form action="LoginCheckServlet" method="POST">
			<input maxlength="45" name="CNumber" placeholder="Contact Number" required
				style="width: 70%; height: 47px; line-height: 47px; text-align: center;"
				type="text" /><br /> <br /> <input maxlength="20" name="Password"
				placeholder="password" required
				style="width: 70%; height: 47px; line-height: 47px; text-align: center;"
				type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				title="Must contain at least one number, one uppercase and lowercase letter, and at least 8 characters"
				required /><br />
			<br /> <input
				style="background-color: #FF008C; width: 120px; border: none; color: white; height: 30px"
				type="submit" value="login" /><br />
			<br /> <br /> <br />
			<br /> <br /> <br /> <br />
		</form>

		<script>
			var
		</script>
	</div>
</body>
</html>
