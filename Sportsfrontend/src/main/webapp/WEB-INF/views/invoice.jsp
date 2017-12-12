<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	padding-bottom: 100px;
}
</style>
</head>
<body>

	<div class="container">

		<div class="jumbotron">
			<h3>
				<center>INVOICE</center>
			</h3>
		</div>
	</div>
	<div class="container">
		<div class="row">

			<div class="panel panel-default">
				<div class="panel-heading text-center">Customer Details</div>

				<div class="panel-body">
					<table>
						<tr>
							<th>Customer Name:</th>
						</tr>
						<tr>
							<td>${Customer.customerName}</td>
						</tr>

						<tr>
							<th>Customer Email:</th>
						</tr>
						<tr>
							<td>${Customer.customerEmail}</td>
						</tr>

						<tr>
							<th>Shipping Address:</th>
						<tr>
							<td>Apartment:</td>
							<td>${Customer.shippingAddress.apartmentNumber}</td>
						</tr>
						<tr>
							<td>city:</td>
							<td>${Customer.shippingAddress.city}</td>
						</tr>
						<tr>
							<td>country:</td>
							<td>${Customer.shippingAddress.country}</td>
						</tr>
						<tr>
							<td>state:</td>
							<td>${Customer.shippingAddress.state}</td>
						</tr>
						<tr>
							<td>streetName:</td>
							<td>${Customer.shippingAddress.streetName}</td>
						</tr>
						<tr>
							<td>zipcode:</td>
							<td>${Customer.shippingAddress.zipcode}</td>
						</tr>
						<tr>
							<th>Delivery within 7 working days</th>

						</tr>
					</table>

				</div>
			</div>

		</div>
	</div>
	<div class="container">
		<div class="row">

			<div class="panel panel-default">
				<div class="panel-heading text-center">Payment Information</div>

				<div class="panel-body">
					<table>
						<tr>
							<th>Payment Method:</th>
						</tr>
						<tr>
							<td>${orderList.payment}</td>
						</tr>

						<tr>
							<th>Billing Address:</th>
						</tr>
						<tr>
							<td>Apartment:</td>
							<td>${Customer.billingAddress.apartmentNumber}</td>
						</tr>
						<tr>
							<td>city:</td>
							<td>${Customer.billingAddress.city}</td>
						</tr>
						<tr>
							<td>country:</td>
							<td>${Customer.billingAddress.country}</td>
						</tr>
						<tr>
							<td>state:</td>
							<td>${Customer.billingAddress.state}</td>
						</tr>
						<tr>
							<td>streetName:</td>
							<td>${Customer.billingAddress.streetName}</td>
						</tr>
						<tr>
							<td>zipcode:</td>
							<td>${Customer.billingAddress.zipcode}</td>
						</tr>
					</table>

				</div>
			</div>

		</div>
	</div>

	<div class="container text-center">
		<a href="ackOrder"><button class="btn-primary">CONFIRM
				ORDER</button></a>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>