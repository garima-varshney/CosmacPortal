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
}

.card:focus, .card:hover {
	box-shadow: 0 5px 11px 0 rgba(0, 0, 0, 0.18), 0 4px 15px 0
		rgba(0, 0, 0, 0.15);
}

.item, img {
        height: 75% !important;
        width:  95% !important;
        border: 2px solid red;
}
.heading {
		color: #560E3B; 
		text-align: center; 
		font-family: Times New Roman;
}  
.heading2 { 
		text-align: center; 
		font-family: Times New Roman;
} 	
</style>
<title>Index</title>
</head>
<body>

	<%@include file="Header.jsp"%>

	<br>
	<br>
	<br>
	<br>

	<div class="container" align="center">

		<!-- Card -->
		<article class="card animated fadeInLeft"> 
		<img class="card-img-top img-responsive" src="resources/images/products1.jpg" alt="Products" />
		<div class="card-block">
			<a class="activator"><i class="fa fa-share-alt"></i></a> <br>
			<h2 class="card-title heading">PRODUCTS</h2>
			<h4 class="heading2"><a href="Product">See More</a></h4>
			<br>
		</div>
		</article>

		<br>
		<br>
		<br> 
		
		<!-- Card -->
		<article class="card animated fadeInLeft"> 
		<img class="card-img-top img-responsive" src="resources/images/categories1.jpg" alt="Categories" />
		<div class="card-block">
			<a class="activator"><i class="fa fa-share-alt"></i></a> <br>
			<h2 class="card-title heading">CATEGORIES</h2>
			<h4 class="heading2"><a href="Category">See More</a></h4>
			<br>
		</div>
		</article>
		
		<br>
		<br>
		<br>
		
		<!-- Card -->
		<article class="card animated fadeInLeft"> 
		<img class="card-img-top img-responsive" src="resources/images/supplier1.jpg" alt="Suppliers" />
		<div class="card-block">
			<a class="activator"><i class="fa fa-share-alt"></i></a> <br>
			<h2 class="card-title heading">SUPPLIERS</h2>
			<h4 class="heading2"><a href="Supplier">See More</a></h4>
			<br>
		</div>
		</article>
		
		<br>
		<br>
		<br>

	</div>

</body>
</html>