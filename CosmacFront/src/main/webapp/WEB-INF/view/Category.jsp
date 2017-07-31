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
<title>Category</title>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<h2 class="hStyle" align="center">CATEGORY</h2>
		<hr class="hrStyle">
		<br>

		<div class="container" align="center">
			<form:form class="well form-horizontal"
				action="${pageContext.request.contextPath}/addCategory"
				method="post" commandName="category" id="category_form">
				<fieldset>

					<!-- Form Name -->
					<c:if test="${empty category.categoryId}">
						<legend class="subStyle">Insert Category</legend>
					</c:if>

					<c:if test="${! empty category.categoryId}">
						<legend class="subStyle">Update Category</legend>
					</c:if>

					<!-- Text display -->
					<c:if test="${! empty category.categoryId}">
						<div class="form-group">
							<label class="col-md-4 control-label formLabel">Id</label>
							<div class="col-md-4">
								<form:input path="categoryId" disabled="true" readOnly="true"
									class="form-control" />
								<form:hidden path="categoryId" />
							</div>
						</div>
					</c:if>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label formLabel" path="name">
							Name <form:errors path="categoryName" class="errorStyle"></form:errors>
						</label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-pencil"></i></span>
								<form:input path="categoryName" class="form-control"
									placeholder="name" />
							</div>
						</div>
					</div>

					<!-- Text input -->
					<div class="form-group">
						<label class="col-md-4 control-label formLabel">
							Description <form:errors path="categoryDesc" class="errorStyle"></form:errors>
						</label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-edit"></i></span>
								<form:input path="categoryDesc" class="form-control"
									placeholder="description" />
							</div>
						</div>
					</div>

					<!-- Button input -->
					<c:if test="${empty category.categoryId}">
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
					<c:if test="${not empty category.categoryId}">
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
			<c:if test="${not empty categoryList}">
				<div align="center">
					<table class="table table-hover table-condensed table-bordered">
						<thead class="headStyle">
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Description</th>
								<th colspan=2></th>
							</tr>
						</thead>
						<tbody class="bodyStyle">
							<c:forEach var="cat" items="${categoryList}">
								<tr>
									<td>${cat.categoryId}</td>
									<td>${cat.categoryName}</td>
									<td>${cat.categoryDesc}</td>
									<td align="center"><a
										href="editCategory/${cat.categoryId}"><input type="submit"
											value="EDIT" class="btn btn-success" /></a></td>
									<td align="center"><a
										href="deleteCategory/${cat.categoryId}"><input
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