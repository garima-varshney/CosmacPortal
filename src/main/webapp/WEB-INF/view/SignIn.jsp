<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
.formLabel {
	color: black;
	font-family: cursive;
	font-size: 1.1em;
}

.errorStyle {
	color: red;
	font-family: Times New Roman;
	font-size: 0.9em;
	font-style: oblique;
}

.paraStyle1 {
	font-family: Times New Roman;
	font-size: 1.2em;
}

.paraStyle {
	color: #B21477;
	font-family: Times New Roman;
	font-size: 1.3em;
}
</style>
<title>SignIn</title>
</head>
<body>

	<%@include file="Header.jsp"%>

	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container" align="justify">
		<form action="validate" class="well form-horizontal" method="post">
			<fieldset>

				<br> <br>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label formLabel"> Email </label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-envelope"></i></span> <input name="email"
								class="form-control" placeholder="enter your email address" />
						</div>
					</div>
				</div>

				<!-- Text input -->
				<div class="form-group">
					<label class="col-md-4 control-label formLabel"> password </label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-exclamation-sign"></i></span> <input
								name="password" class="form-control"
								placeholder="enter your password" />
						</div>
					</div>
				</div>

				<!-- Button input -->
				<div class="form-group" align="center">
					<div>
						<button type="submit" class="btn btn-warning"
							style="width: 200px;">Sign In</button>
					</div>
				</div>

				<!-- Text display-->
				<div class="form-group" align="center">
					<div class="inputGroupContainer">
						<div class="input-group">
							<p class="paraStyle">
								Not Registered? First <a href="SignUp" class="paraStyle1">Sign
									Up</a>
							</p>
						</div>
					</div>
				</div>

			</fieldset>
		</form>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>

	<%@include file="Footer.jsp"%>

</body>
</html>