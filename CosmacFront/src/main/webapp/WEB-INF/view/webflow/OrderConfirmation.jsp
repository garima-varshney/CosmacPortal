<%@include file="/WEB-INF/view/Header.jsp"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />

<div class="space"></div>
<div class="container">
	<h2 class="heading-one">Order Confirmation</h2>
	<div class="space"></div>
	<form:form modelAttribute="order">

		<div
			class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 co-md-offset-3">

			<div class="text-center">
				<h1>Receipt</h1>
			</div>
			<hr>
			<div class="row">
				<div class="col-xs-8 col-sm-8 col-md-8">
					<b>Name: </b>${loggedInName}
					<br>
					<b>Email: </b> ${order.users.email}
					<br>
					<b>Mobile No: </b> ${order.users.mobile}
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 ">
					<p>
						<b>Shipping Date:</b>
						<fmt:formatDate type="date" value="${now}" />
					</p>
				</div>
			</div>
<hr>
			<div class="row">
				<div class="col-xs-6 col-sm-6 col-md-6">
					<address>
						<strong>Billing Address</strong><br>
						${order.users.billing.addLine} <br>						
						${order.users.billing.city},
						${order.users.billing.state} <br>
						${order.users.billing.country},
						${order.users.billing.zipcode} <br>
					</address>
				</div>
				<div class="col-xs-6 col-sm-6">
					<address>
						<strong>Shipping Address</strong><br>
						${order.users.shipping.shipAdd} <br>						
						${order.users.shipping.shipCity},
						${order.users.shipping.shipState} <br>
						${order.users.shipping.shipCountry},
						${order.users.shipping.shipZip} <br>
					</address>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Product</th>
							<th class="text-center">Quantity</th>
							<th class="text-center">Price/Unit</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cartItem" items="${order.users.cart}">
							<tr>
								<td class="col-md-9"><em>${cartItem.productName}</em></td>
								<td class="col-md-1" style="text-align: center">${cartItem.quantity}</td>
								<td class="col-md-1" style="text-align: center">${cartItem.price}</td>
							</tr>
						</c:forEach>

						<tr>
							<td class="text-right">
								<h4>
									<strong>Grand Total: </strong>
								</h4>
							</td>
							<td class="text-center text-danger" colspan="2">
								<h4>
									<strong>Rs ${totalAmount} </strong>
								</h4>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<input type="hidden" name="_flowExecutionKey" /> <br> <br>
			<button class="btn btn-outline-warning"
				name="_eventId_backToCollectUserDetail">Back</button>
			<input type="submit" value="Submit Order"
				class="btn btn-outline-primary" name="_eventId_orderConfirmed" />
			<button class="btn btn-default" name="_eventId_cancel">Cancel</button>
		</div>
	</form:form>
</div>