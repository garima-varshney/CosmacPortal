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
.hStyle {
	color: #000000;
	font-family: Trebuchet MS Bold;
	font-weight: bold;
}

.headStyle {
	color: red;
	background-color: #FFEFD5;
	font-family: Times New Roman;
	font-size: 1.3em;
	text-align: center;
}

.bodyStyle {
	color: black;
	font-family: Palatino Linotype;
	font-size: 1.1em;
}

.hrStyle {
	color: red;
	height: 1px;
	background: #333;
	background-image: linear-gradient(to right, #2980B9, #FA8072, #F528D0);
}
</style>
<title>Users</title>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<h2 class="hStyle" align="center">REGISTERED USERS</h2>
		<hr class="hrStyle">
		<br>

		<div class="container" align="center">
			<div align="center">
				<table class="table table-hover table-condensed table-bordered">
					<thead class="headStyle">
						<tr>
							<th>User Id</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>E-mail</th>
							<th>Password</th>
							<th>Username</th>
							<th>Mobile</th>
							<th>Enable</th>
						</tr>
					</thead>
					<tbody class="bodyStyle">
						<c:forEach var="u" items="${usersList}">
							<tr>
								<td>${u.userId}</td>
								<td>${u.fName}</td>
								<td>${u.lName}</td>
								<td>${u.email}</td>
								<td>${u.pass}</td>
								<td>${u.uname}</td>
								<td>${u.mobile}</td>
								<td>${u.enable}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br>
	<br>
	
</body>
</html>