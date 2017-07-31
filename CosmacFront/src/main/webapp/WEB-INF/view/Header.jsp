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
nav {
	height: 40px;
}

.nav a {
	color: white !important;
	font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
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
		<a class="navbar-brand visible-xs-inline-block text-center" href="#"
			style="font-family: Palatino; font-size: 2.0em; color: white">COSMAC</a>
	</div>

	<div class="collapse navbar-collapse navbar-ex1-collapse"
		style="background-color: #000000;">
		<div class="container">
			<ul class="nav navbar-nav js-nav-add-active-class  hidden-xs">
				<li><a href="${pageContext.request.contextPath}/"
					style="font-size: 3.0em">COSMAC</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right hidden-xs">
				<li class="dropdown"
					style="font-family: Palatino; font-size: 1.6em;"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> Products </a>
					<ul class="dropdown-menu"
						style="background-color: black; font-style: italic; font-size: medium; padding: 1.2em;">
						<c:forEach var="cat" items="${categoryL}">
							<li><a
								href="${pageContext.request.contextPath}/ShowProduct/${cat.categoryId}">
									${cat.categoryName} </a></li>
						</c:forEach>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/"
					data-toggle="tooltip" data-placement="top" title="Home"
					style="font-size: 1.6em"><span class="glyphicon glyphicon-home"></span></a></li>
				<security:authorize access="isAuthenticated()">
					<li><a href="${pageContext.request.contextPath}/myCart/all"
						data-toggle="tooltip" data-placement="top" title="Cart"
						style="font-size: 1.6em"><span
							class="glyphicon glyphicon-shopping-cart"></span></a></li>
				</security:authorize>
				<security:authorize access="isAnonymous()">
					<li><a href="${pageContext.request.contextPath}/SignIn"
						data-toggle="tooltip" data-placement="top" title="Sign in"
						style="font-size: 1.6em"><span
							class="glyphicon glyphicon-log-in"></span></a></li>
					<li><a href="${pageContext.request.contextPath}/SignUp"
						data-toggle="tooltip" data-placement="top" title="Sign up"
						style="font-size: 1.6em"><span
							class="glyphicon glyphicon-user"></span></a></li>
				</security:authorize>
				<security:authorize access="isAuthenticated()">
					<li><a href="${pageContext.request.contextPath}/SignOut"
						data-toggle="tooltip" data-placement="top" title="Sign out"
						style="font-size: 1.6em"><span
							class="glyphicon glyphicon-log-out"></span></a></li>
				</security:authorize>
			</ul>
			<ul class="nav navbar-nav js-nav-add-active-class">
				<li class="visible-xs-block"><a
					href="${pageContext.request.contextPath}/SignIn">Sign in</a></li>
				<li class="visible-xs-block"><a
					href="${pageContext.request.contextPath}/SignUp">Sign Up</a></li>
				<li class="visible-xs-block"><a
					href="${pageContext.request.contextPath}/ContactUs">Contact Us</a></li>
				<li class="visible-xs-block"><a
					href="${pageContext.request.contextPath}/AboutUs">About Us</a></li>
			</ul>
		</div>
	</div>
	</nav>
</body>
</html>