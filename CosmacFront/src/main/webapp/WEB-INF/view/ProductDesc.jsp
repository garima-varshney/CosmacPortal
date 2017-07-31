<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style type="text/css">
.hStyle {
	color: red;
	font-family: Georgia;
	font-style: italic;
	font-weight: bold;
}

.thumbnail {
	height: 100%;
	width: 100%;
	display: table-cell;
	vertical-align: middle;
}

.contentHeadStyle {
	color: black;
	font-family: Palatino Linotype;
	font-size: 1.4em;
}

.contentStyle {
	color: black;
	font-family: Palatino Linotype;
	font-size: 1.2em;
}
</style>
<title>ProductDescription</title>
</head>
<body>

	<%@include file="Header.jsp"%>

	<br>
	<br>
	<br>
	<br>

	<div class="container" align="center">

		<div class="page-header hStyle">
			<h1>Product Details</h1>
		</div>

		<div class="col-md-8">
			<a href="#" class="thumbnail"> <img
				src="<c:url value="/resources/images/${prdDesc.prdId}.jpg"/>"
				alt="product" />
			</a>
		</div>

		<div class="col-md-4">
			<div class="row contentHeadStyle">
				<div align="center">
					<p>
						<b>${prdDesc.prName}</b>
					</p>
				</div>
			</div>
			<div class="row contentStyle">
				<div align="left">
					<p>${prdDesc.prodDesc}</p>
				</div>
			</div>
			<div class="row contentStyle">
				<div align="left">
					<p>
						<b>PRICE:</b> Rs. ${prdDesc.price}/-
					</p>
				</div>
			</div>
		</div>

		<!-- Button -->
		<div class="row">
			<div align="center">
				<security:authorize access="hasRole('ROLE_USER')">
					<a
						href="${pageContext.request.contextPath}/myCart/addToCart/${prdDesc.prdId}"
						class="btn btn-success"> <i class="glyphicon glyphicon-heart"></i>
						Add to CART
					</a>
				</security:authorize>
				<security:authorize access="isAnonymous()">
					<a href="${pageContext.request.contextPath}/AddingProduct"
						class="btn btn-success"> <i class="glyphicon glyphicon-heart"></i>
						Add to CART
					</a>
				</security:authorize>
			</div>
		</div>
	</div>

	<br>
	<br>
	<br>
	<br>

	<%@include file="Footer.jsp"%>

</body>
</html>