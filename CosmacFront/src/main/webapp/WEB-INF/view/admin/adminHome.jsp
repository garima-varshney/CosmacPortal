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
.card {
	overflow: hidden;
	height: 50%;
	-webkit-transition: .25s box-shadow;
	transition: .25s box-shadow;
	padding: 10px;
}

.card:focus, .card:hover {
	box-shadow: 0 5px 11px 0 rgba(0, 0, 0, 0.18), 0 4px 15px 0
		rgba(0, 0, 0, 0.15);
}

.hStyle {
	color: #000000;
	font-family: Trebuchet MS Bold;
	font-weight: bold;
}

.subStyle {
	color: #453c3c;
	font-family: Georgia;
	font-style: italic;
}
</style>
<title>Index</title>
</head>
<body>

	<%@include file="/WEB-INF/view/navbar.jsp"%>

	<br>
	<br>
	<br>
	<br>

	<div class="container" align="center">

		<h1 class="hStyle">Welcome Home!</h1>
		<br> <br>
		<h3 class="hStyle">|  ADMIN PAGE  |</h3>
		<br> <br>

		<!-- Card -->
		<div class="row">
			<div class="col-sm-6">
				<div class="card">
					<div class="card-block">
						<h3 class="card-title subStyle">CATEGORIES</h3>
						<br> <a href="Category" class="btn btn-success"
							style="width: 200px;">See ALL</a><br>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="card">
					<div class="card-block">
						<h3 class="card-title subStyle">PRODUCTS</h3>
						<br> <a href="Product" class="btn btn-success"
							style="width: 200px;">See ALL</a><br>
					</div>
				</div>
			</div>
		</div>

		<br> <br> <br>

		<!-- Card -->
		<div class="row">
			<div class="col-sm-6">
				<div class="card">
					<div class="card-block">
						<h3 class="card-title subStyle">SUPPLIERS</h3>
						<br> <a href="Supplier" class="btn btn-success"
							style="width: 200px;">See ALL</a><br>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="card">
					<div class="card-block">
						<h3 class="card-title subStyle">USERS</h3>
						<br> <a href="User" class="btn btn-success"
							style="width: 200px;">See ALL</a><br>
					</div>
				</div>
			</div>
		</div>

		<br> <br> <br>

	</div>

</body>
</html>