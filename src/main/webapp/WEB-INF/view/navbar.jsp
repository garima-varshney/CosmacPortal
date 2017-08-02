<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
nav {
	height: 55px;
}

.nav a {
	color: white !important;
	font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
}

.navbar-inverse {
	background-color: #7B241C;
}
</style>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
	</div>

	<div class="collapse navbar-collapse navbar-ex1-collapse"
		style="background-color: #7B241C;">
		<div class="container">
			<ul class="nav navbar-nav js-nav-add-active-class hidden-xs">
				<li><a href="${pageContext.request.contextPath}/adminHome"
					style="font-size: 2.8em">COSMAC</a></li>
				<li><a href="${pageContext.request.contextPath}/Product"
					style="font-size: 1.1em">Product</a></li>
				<li><a href="${pageContext.request.contextPath}/Category"
					style="font-size: 1.1em">Category</a></li>
				<li><a href="${pageContext.request.contextPath}/Supplier"
					style="font-size: 1.1em">Supplier</a></li>
				<li><a href="${pageContext.request.contextPath}/User"
					style="font-size: 1.1em">User</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right hidden-xs">
				<li><a href="${pageContext.request.contextPath}/adminHome"
					data-toggle="tooltip" data-placement="top" title="Home"
					style="font-size: 1.3em"><span class="glyphicon glyphicon-home"></span></a></li>
				<security:authorize access="isAnonymous()">
					<li><a href="${pageContext.request.contextPath}/SignIn"
						data-toggle="tooltip" data-placement="top" title="Sign in"
						style="font-size: 1.3em"><span
							class="glyphicon glyphicon-user"></span></a></li>
				</security:authorize>
				<security:authorize access="isAuthenticated()">
					<li><a href="${pageContext.request.contextPath}/SignOut"
						data-toggle="tooltip" data-placement="top" title="Sign out"
						style="font-size: 1.3em"><span
							class="glyphicon glyphicon-log-out"></span></a></li>
				</security:authorize>
			</ul>
		</div>
	</div>
	<!-- /.navbar-collapse --> <!-- /.container-fluid --> </nav>
</body>
</html>