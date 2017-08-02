<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="Header.jsp"%>
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

.headStyle {
	color: #2980B9;
	background-color: #EAEDED;
	font-size: 1.3em;
	font-family:cursive;
}

.bodyStyle {
	color: black;
	font-family: Palatino Linotype;
	font-size: 1.2em;
}

.btnStyle{
	width: 9.0em;
	height: 2.5em;
}
</style>
<title>Cart</title>
</head>
<body>

	<br>
	<br>

	<div class="container" align="center">

		<div class="page-header hStyle">
			<h1>Your Cart</h1>
		</div>
		<br>

		<c:if test="${empty cartList}">
			<div class="alert alert-warning bodyStyle">You have not added
				any product into cart.</div>
		</c:if>

		<c:if test="${not empty cartList}">
			<div align="center">
				<table class="table table-hover table-condensed">
					<thead class="headStyle">
						<tr style="height: 2.2em;">
							<th>Product Name</th>
							<th>Quantity</th>
							<th>Price</th>
							<th></th>
						</tr>
					</thead>

					<tbody class="bodyStyle">
						<c:forEach items="${cartList}" var="cart">
							<tr style="height: 2.5em;">
								<td>${cart.productName}</td>
								<td>${cart.quantity }</td>
								<td>&#8377 ${cart.price}</td>
								<td align="center"><a
									href="<c:url value='/myCart/deleteProduct/${cart.cartId}'/>">
										<span class="glyphicon glyphicon-trash"></span>
								</a></td>
							</tr>
						</c:forEach>
						<tr style="height: 2.5em;">
							<td colspan=2><b class="text-success">Total Amount:</b></td>
							<td><em><b class="text-success">&#8377
										${totalAmount}</b></em></td>
							<td align="center"><a
								href="<c:url value="/myCart/clearCart" />"
								class="btn btn-danger"> Clear Cart </a></td>
						</tr>
						<tr style="height: 2.5em;">
							<td colspan=4 align="center"><a
								href="<c:url value="/order"/>" class="btn btn-primary btnStyle">
									Place Order </a></td>
						</tr>
					</tbody>
				</table>
			</div>
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
