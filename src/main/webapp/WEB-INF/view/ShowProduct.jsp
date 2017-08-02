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
	color: red;
	font-family: Georgia;
	font-style: italic;
	font-family: Georgia;
}

.subStyle {
	font-family: Trebuchet MS Bold;
	color: black;
}

.thumbnail {
	height: 350px;
	width: 350px;
	vertical-align: middle;
}

</style>
<title>All Product</title>
</head>
<body>

	<%@include file="Header.jsp"%>

	<br>
	<br>
	<br>
	<br>

	<div class="container" align="center">
		<c:if test="${not empty productL}">
			<div class="page-header">
				<h1 class="hStyle">All Products</h1>
			</div>

			<c:forEach var="pr" items="${productL}">
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
						<h3><b>${pr.prName}</b></h3>
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
		<c:if test="${empty productL}">
			<h3>Sorry! No Products to show</h3>
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