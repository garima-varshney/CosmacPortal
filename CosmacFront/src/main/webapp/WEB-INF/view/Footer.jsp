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
<style type="text/css">
.footer {
	background: black;
	height: auto;
	padding: 30px;
	width: 100%;
	border-bottom: 1px solid #CCCCCC;
	width: 100%;
}

.footer h3 {
	color: white;
	font-weight: 500;
	text-transform: uppercase;
	font-family: Times New Roman;
	font-size: 1.4em;
}

.footer h1 {
	color: white;
	font-weight: 800;
	font-family: Palatino Linotype;
	font-size: 3.2em;
}

.footer-bottom {
	background: black;
	padding-top: 10px;
	padding-bottom: 10px;
	color: white;
	padding-bottom: 10px;
}

.footer a {
	color: white;
	font-family: Times New Roman;
	font-size: 1.1em;
}
</style>

</head>
<body>

	<footer>
	<div class="footer" id="footer">
		<div class="container">
			<div class="row">

				<div class="col-lg-4 hidden-xs hidden-sm hidden-md" align="center">
					<h1>COSMAC</h1>
				</div>

				<div class="col-lg-4 col-md-6 col-xs-4" align="right">
					<h3>Know More</h3>
					<ul>
						<li><a href="${pageContext.request.contextPath}/ContactUs">
								Get in Touch </a></li>
						<li><a href="${pageContext.request.contextPath}/AboutUs">
								About Us </a></li>
						<li><a href="${pageContext.request.contextPath}/Shop">
								See our Products </a></li>
					</ul>
				</div>

				<div class="col-lg-4 col-md-6 col-xs-4" align="right">
					<h3>Quick Links</h3>
					<ul>
						<li><a href="${pageContext.request.contextPath}/SignIn">
								Sign In </a></li>
						<li><a href="${pageContext.request.contextPath}/SignUp">
								Sign Up </a></li>
						<security:authorize access="hasRole('ROLE_USER')">
							<li><a href="${pageContext.request.contextPath}/myCart/all">
									Cart </a></li>
						</security:authorize>
						<security:authorize access="isAnonymous()">
							<li><a href="${pageContext.request.contextPath}/AddingProduct">
									Cart </a></li>
						</security:authorize>
					</ul>
				</div>
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->
	</div>
	<!--/.footer--> <!--/.footer-bottom-->
	<div class="footer-bottom">
		<div class="container">
			<p align="center">©2017 COSMAC. All right reserved.</p>
		</div>
	</div>
	</footer>

</body>
</html>