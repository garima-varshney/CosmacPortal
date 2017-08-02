<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
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
<title>Home Page</title>
<style type="text/css">
.carousel-inner {
	height: 600px;
}

.item, img {
	height: 100% !important;
	width: 100% !important;
	border: 2px solid black;
}
</style>
</head>

<body>

	<security:authorize access="hasRole('ROLE_ADMIN')">
		<jsp:forward page="/adminHome"></jsp:forward>
	</security:authorize>

	<div class="container">
		<%@include file="Header.jsp"%>
	</div>

	<br>
	<br>

	<div id="myCarousel" class="carousel slide" data-ride="carousel">

		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
			<li data-target="#myCarousel" data-slide-to="5"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">

			<div class="item active">
				<img src="resources/images/lakme1.jpg" alt="image1">
				<div class="carousel-caption"></div>
			</div>

			<div class="item">
				<img src="resources/images/maybelline3.jpg" alt="image2">
			</div>

			<div class="item">
				<img src="resources/images/mac1.jpg" alt="image3">
			</div>

			<div class="item">
				<img src="resources/images/tres1.jpg" alt="image4">
			</div>

			<div class="item">
				<img src="resources/images/ponds.jpg" alt="image5">
			</div>

			<div class="item">
				<img src="resources/images/himalaya.jpg" alt="image6">
			</div>

		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>

	</div>

	<br>
	<br>
	<p style="text-align: center;">
		<a class="btn btn-primary" href="Shop" role="button"
			style="font-size: 24px; font-family: Times New Roman; width: 200px; height: 50px; background-color: #000000; color: white; cursor: pointer; text-align: center;">SHOP
			NOW </a>
	</p>

	<br> <br> <br> <br> <br> <br> <br>
	
	<%@include file="Footer.jsp"%>
</body>
</html>