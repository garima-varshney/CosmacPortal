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
.subStyle {
	font-family: Trebuchet MS Bold;
	color: black;
}

.thumbnail {
	height: 350px;
	width: 350px;
	vertical-align: middle;
}

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

.heading {
	color: #560E3B;
	text-align: center;
	font-family: Georgia;
}

.heading2 {
	color: red;
	text-align: center;
	font-family: Times New Roman;
	font-style: italic;
}

.heading3 {
	color: black;
	text-align: center;
	font-family: Trebuchet MS Bold;
	font-size: 1.4em;
}
</style>
<title>Shop</title>
</head>
<body>

	<%@include file="Header.jsp"%>

	<br>
	<br>
	<br>
	<br>

	<div class="container" align="center">
		<!-- Card -->
		<article class="card animated fadeInLeft"> <img
			class="card-img-top img-responsive" src="resources/images/random.jpg"
			alt="Products" style="height: 75%; width: 100%;" />
		<div class="card-block">
			<a class="activator"><i class="fa fa-share-alt"></i></a> <br> <br>
		</div>
		</article>

		<h1 class="heading">* Exclusive at COSMAC *</h1>
		<br>

		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"> <img src="resources/images/prod.jpg" alt="..."
						style="width: 100%; height: 100%;">
					</a>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"> <img src="resources/images/prod1.jpg" alt=""
						style="width: 100%; height: 100%;">
					</a>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"> <img src="resources/images/prod2.jpg" alt=""
						style="width: 100%; height: 100%;">
					</a>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"> <img src="resources/images/prod4.jpg" alt="..."
						style="width: 100%; height: 100%;">
					</a>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"> <img src="resources/images/prod6.jpg" alt=""
						style="width: 100%; height: 100%;">
					</a>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="#"> <img src="resources/images/prod5.jpg" alt=""
						style="width: 100%; height: 100%;">
					</a>
				</div>
			</div>
		</div>

		<c:if test="${not empty allProducts}">
			<div class="page-header">
				<h1 class="heading2">Shop our Products here</h1>
			</div>

			<c:forEach var="pr" items="${allProducts}">
				<div class="row" align="center">
					<div class="thumbnail">
						<a
							href="${pageContext.request.contextPath}/ProductDesc/${pr.prdId}"
							class="thumbnail"> <img
							src="<c:url value="/resources/images/${pr.prdId}.jpg"/>"
							alt="..." />
						</a>
					</div>
					<div class="caption subStyle">
						<h3>
							<b>${pr.prName}</b>
						</h3>
						<h4>Price : Rs.${pr.price}</h4>
						<p>
							<a
								href="${pageContext.request.contextPath}/ProductDesc/${pr.prdId}">See
								More</a>
						</p>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<%@include file="Footer.jsp"%>

</body>
</html>