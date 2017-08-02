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

.subStyle {
	color: #453c3c;
	font-family: Georgia;
	font-style: italic;
	font-weight: bold;
}

.formLabel {
	color: black;
	font-family: cursive;
	font-size: 1.1em;
}

.errorStyle {
	color: red;
	font-family: Times New Roman;
	font-size: 0.9em;
	font-style: oblique;
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
<title>Product</title>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<h2 class="hStyle" align="center">PRODUCT</h2>
		<hr class="hrStyle">
		<br>

		<div class="container" align="center">
			<form:form class="well form-horizontal"
				action="${pageContext.request.contextPath}/addProduct" method="post"
				commandName="product" enctype="multipart/form-data">
				
				<fieldset>

					<!-- Form Name -->
					<c:if test = "${empty product.prName}">
						<legend class="subStyle">Insert Product</legend>
					</c:if>

					<c:if test = "${not empty product.prName}">
						<legend class="subStyle">Update Product</legend>
					</c:if>

					<!-- Text display -->
					<c:if test = "${not empty product.prName}">
						<div class="form-group">
							<label class="col-md-4 control-label formLabel">Id</label>
							<div class="col-md-4">
								<form:input path="prdId" disabled="true" readOnly="true"
									class="form-control" />
								<form:hidden path="prdId" />
							</div>
						</div>
					</c:if>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label formLabel"> Name <form:errors
								path="prName" class="errorStyle"></form:errors>
						</label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-pencil"></i></span>
								<form:input path="prName" class="form-control"
									placeholder="name" />
							</div>
						</div>
					</div>

					<!-- Text input -->
					<div class="form-group">
						<label class="col-md-4 control-label formLabel">
							Description <form:errors path="prodDesc" class="errorStyle"></form:errors>
						</label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-edit"></i></span>
								<form:input path="prodDesc" class="form-control"
									placeholder="description" />
							</div>
						</div>
					</div>

					<!-- Text input -->
					<div class="form-group">
						<label class="col-md-4 control-label formLabel"> Price <form:errors
								path="price" class="errorStyle"></form:errors>
						</label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-usd"></i></span>
								<form:input path="price" class="form-control"
									placeholder="price" />
							</div>
						</div>
					</div>

					<!-- Text input -->
					<div class="form-group">
						<label class="col-md-4 control-label formLabel"> Quantity
							<form:errors path="quantity" class="errorStyle"></form:errors>
						</label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-question-sign"></i></span>
								<form:input path="quantity" class="form-control"
									placeholder="quantity" />
							</div>
						</div>
					</div>

					<!-- Select input -->
					<div class="form-group">
						<label class="col-md-4 control-label formLabel"> Choose
							Category </label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<form:select path="catid">
								<option value="null" label="-- Select One --" />									
									<c:forEach var="cList" items="${catList}">
										<option value="${cList.categoryId}">
											${cList.categoryId}</option>
									</c:forEach>
								</form:select>
							</div>
						</div>
					</div>

					<!-- Select input -->
					<div class="form-group">
						<label class="col-md-4 control-label formLabel"> Choose
							Supplier </label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<form:select path="supplierId">
								<option value="null" label="-- Select One --" />
									<c:forEach var="sList" items="${suppList}">
										<option value="${sList.suppId}">${sList.suppId}</option>
									</c:forEach>
								</form:select>
							</div>
						</div>
					</div>

					<!-- Image input -->
					<div class="form-group">
						<label class="col-md-4 control-label formLabel"></label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
									<form:input name="image" path="image" type="file" />
							</div>
						</div>
					</div>

					<!-- Button input -->
					<c:if test = "${empty product.prName}">
						<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-4">
								<button type="submit" class="btn btn-warning">
									<i class="glyphicon glyphicon-save"></i> ADD </span>
								</button>
							</div>
						</div>
					</c:if>

					<!-- Button input -->
					<c:if test = "${not empty product.prName}">
						<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-4">
								<button type="submit" class="btn btn-warning">
									<i class="glyphicon glyphicon-floppy-save"></i> UPDATE </span>
								</button>
							</div>
						</div>
					</c:if>

				</fieldset>
			</form:form>
		</div>

		<hr class="hrStyle">
		<br>

		<div class="container" align="center">
			<c:if test="${not empty productList}">
				<div align="center">
					<table class="table table-striped table-hover table-condensed">
						<thead class="headStyle">
							<tr>
								<th>Product Id</th>
								<th>Category Id</th>
								<th>Supplier Id</th>
								<th>Name</th>
								<th>Description</th>
								<th>Price</th>
								<th>Quantity</th>
								<th colspan=2></th>
							</tr>
						</thead>
						<tbody class="bodyStyle">
							<c:forEach var="pr" items="${productList}">
								<tr>
									<td>${pr.prdId}</td>
									<td>${pr.catid}</td>
									<td>${pr.supplierId}</td>
									<td>${pr.prName}</td>
									<td>${pr.prodDesc}</td>
									<td>${pr.price}</td>
									<td>${pr.quantity}</td>
									<td align="center"><a href="editProduct/${pr.prdId}"><input type="submit"
											value="EDIT" class="btn btn-success" /></a></td>
									<td align="center"><a href="deleteProduct/${pr.prdId}"><input
											type="submit" value="DELETE" class="btn btn-danger" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
		</div>

	</div>
	<br>
	<br>

</body>
</html>