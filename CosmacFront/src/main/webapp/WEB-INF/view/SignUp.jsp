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
label {
	color: #F38912;
	font-family: Times New Roman;
	font-size: 1.2em;
}

.style1 {
	color: red;
	font-family: Times New Roman;
	font-size: 1.4em;
	text-align: center;
}

.subStyle {
	color: #453c3c;
	font-family: Georgia;
	font-style: italic;
	font-weight: bold;
}

.errorStyle {
	color: red;
	font-family: Times New Roman;
	font-size: 0.9em;
	font-style: oblique;
}

.hrStyle {
	color: red;
	height: 1px;
	background: #333;
	background-image: linear-gradient(to right, #2980B9, #FA8072, #F528D0);
}

.hrStyle1 {
	color: black;
	height: 1px;
	background: #333;
	background-image: linear-gradient(to right, #000000, #FFFFFFF, #FFFFFF);
}
</style>
<title>Sign Up</title>
</head>
<body>

	<%@include file="Header.jsp"%>

	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<h2 class="subStyle" align="center">Sign Up</h2>
		<hr class="hrStyle">
		<br>


		<div class="container" align="center">
			<form:form class="well form-horizontal"
				action="${pageContext.request.contextPath}/addUser" method="post"
				commandName="user">
				<fieldset>

					<p class="style1">Enter User details</p>
					<br>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">First Name <form:errors
								path="fName" class="errorStyle"></form:errors>
						</label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span>
								<form:input path="fName" placeholder="First name"
									class="form-control" />
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">Last Name <form:errors
								path="lName" class="errorStyle"></form:errors></label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span>
								<form:input path="lName" placeholder="Last name"
									class="form-control" />
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">E-Mail <form:errors
								path="email" class="errorStyle"></form:errors></label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-envelope"></i></span>
								<form:input path="email" placeholder="E-Mail address"
									class="form-control" />
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">Username <form:errors
								path="uname" class="errorStyle"></form:errors></label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-info-sign"></i></span>
								<form:input path="uname" placeholder="desired username"
									class="form-control" />
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">Password <form:errors
								path="pass" class="errorStyle"></form:errors></label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-exclamation-sign"></i></span>
								<form:input path="pass" placeholder="desired password"
									class="form-control" />
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">Phone <form:errors
								path="mobile" class="errorStyle"></form:errors></label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-earphone"></i></span>
								<form:input path="mobile" placeholder="(+91)9499 286 199"
									class="form-control" />
							</div>
						</div>
					</div>

					<hr class="hrStyle1">
					<p class="style1">Enter Billing details</p>
					<br>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">Address <form:errors
								path="billing.addLine" class="errorStyle"></form:errors></label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-home"></i></span>
								<form:input path="billing.addLine" placeholder="address"
									class="form-control" />
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">City <form:errors
								path="billing.city" class="errorStyle"></form:errors></label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-road"></i></span>
								<form:input path="billing.city" placeholder="city"
									class="form-control" />
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">State <form:errors
								path="billing.state" class="errorStyle"></form:errors></label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-plane"></i></span>
								<form:input path="billing.state" placeholder="state"
									class="form-control" />
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">ZipCode <form:errors
								path="billing.zipcode" class="errorStyle"></form:errors></label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-map-marker"></i></span>
								<form:input path="billing.zipcode" placeholder="zip code"
									class="form-control" />
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">Country <form:errors
								path="billing.country" class="errorStyle"></form:errors></label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-globe"></i></span>
								<form:input path="billing.country" placeholder="country"
									class="form-control" />
							</div>
						</div>
					</div>

					<hr class="hrStyle1">
					<p class="style1">Enter Shipping details</p>
					<br>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">Address <form:errors
								path="shipping.shipAdd" class="errorStyle"></form:errors></label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-home"></i></span>
								<form:input path="shipping.shipAdd" placeholder="address"
									class="form-control" />
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">City <form:errors
								path="shipping.shipCity" class="errorStyle"></form:errors></label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-road"></i></span>
								<form:input path="shipping.shipCity" placeholder="city"
									class="form-control" />
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">State <form:errors
								path="shipping.shipState" class="errorStyle"></form:errors>
						</label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-plane"></i></span>
								<form:input path="shipping.shipState" placeholder="state"
									class="form-control" />
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">ZipCode <form:errors
								path="shipping.shipZip" class="errorStyle"></form:errors></label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-map-marker"></i></span>
								<form:input path="shipping.shipZip" placeholder="zipcode"
									class="form-control" />
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">Country <form:errors
								path="shipping.shipCountry" class="errorStyle"></form:errors></label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-globe"></i></span>
								<form:input path="shipping.shipCountry" placeholder="country"
									class="form-control" />
							</div>
						</div>
					</div>

					<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 control-label"></label>
						<div class="col-md-4">
							<button type="submit" class="btn btn-warning">
								<i class="glyphicon glyphicon-save"></i> SUBMIT
							</button>
						</div>
					</div>

				</fieldset>
			</form:form>
		</div>
	</div>
	<br>
	<br>

	<%@include file="Footer.jsp"%>

</body>
</html>