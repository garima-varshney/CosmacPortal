<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.hStyle {
	font-family: Georgia;
	font-style: italic;
	text-align: center;
}

.bodyStyle {
	color: maroon;
	font-size: 1.8em;
	font-family: Times New Roman;
}

.contentStyle {
	color: black;
	font-size: 1.4em;
	font-family: Times New Roman;
}

</style>
<title>Contact Us</title>
</head>
<body>

	<%@include file="Header.jsp"%>

	<br>
	<br>

	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1 class="display-3 hStyle">CONTACT US</h1>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="well">
					<h3 class="bodyStyle">Registered office:</h3>
					<p class="contentStyle"><b>Cosmac Ltd.</b></p>
					<p class="contentStyle">Corporate Office:</p>
					<p class="contentStyle">Birla Aurora, Level 21</p>
					<p class="contentStyle">Plot No. 1080, Annie Beasant Road,</p>
					<p class="contentStyle">Worli, Mumbai-40030</p>					

					<hr>

					<h3 class="bodyStyle">Enquiry Helpline:</h3>
					<p class="contentStyle"><span class="glyphicon glyphicon-earphone"></span> 1800 209 1800</p>

					<hr>

					<h3 class="bodyStyle">Email:</h3>
					<p class="contentStyle"><span class="glyphicon glyphicon-envelope"></span> supportdesk@cosmac.com</p>

				</div>
			</div>
		</div>
	</div>
	
	<br>
	<br>
	<br>
	<br>
	<br>

	<%@include file="Footer.jsp"%>
	

</body>
</html>