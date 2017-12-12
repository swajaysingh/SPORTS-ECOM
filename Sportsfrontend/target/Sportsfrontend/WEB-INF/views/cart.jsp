
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  isELIgnored="false"    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ include file="header.jsp"%>

<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>

<script src="<c:url value="/resources/js/controller.js"></c:url>"></script>
<!-- DC Table Styles I CSS -->
<link type="text/css" rel="stylesheet"
	href="http://cdn.dcodes.net/2/tables1/css/dc_tables1.css" />
<style type="text/css">
body {
	background: #dbdbdb
		url('http://cdn.dcodes.net/2/bg_images/color/c29.jpg') no-repeat
		center top;
}
</style>

</head>
<body>
	<div class="container-wrapper">
		<div class="container">


			<div class="bg-img">
				<section>
					<div class="jumbotron">
						<div class="container">
							<center>
								<h1>Cart</h1>
								<p>All the selected products in your shopping cart</p>
							</center>
						</div>
					</div>
				</section>



				<div data-ng-app="myapp" data-ng-controller="productController"
					class="cart-table">
					<h1>Your's CartId is ${cartId}</h1>
					<div data-ng-init="getCart(${cartId})">
						<br> List of products purchased

						<div>
							<a class="btn btn-danger pull-left"
								data-ng-click="clearCart(${cartId})"> <span
								class="glyphicon glyphicon-remove-sign"> </span> Clear Cart
							</a>
						</div>



						<table class="table table-hover">
							<thead>

								<tr>
									<th>CARTITEM ID</th>
									<th>PRODUCT NAME</th>
									<th>QUANTITY</th>
									<th>PRICE</th>
									<th>TOTAL PRICE</th>

								</tr>
							</thead>
							<tr data-ng-repeat="cartitems in cart.cartItems">
								<td>{{cartitems.cartItemId}}</td>
								<td>{{cartitems.product.productName}}</td>
								<td>{{cartitems.quantity}}</td>
								<td>INR {{cartitems.product.price}}</td>
								<td>INR {{cartitems.totalPrice}}</td>
								<td>
								   <button data-ng-click="removeFromCart(${cartitems.cartItemId})"class="btn btn-warning"> 
								      <span class="glyphicon glyphicon-remove"></span>Remove
								  </button>
								</td>
							</tr>

						</table>
						<h3 class="grandtotal">
							GrandTotal Price : <strong>INR {{calculateGrandTotal()}}</strong>
						</h3>
					</div>

					<c:url value="/getAllproducts" var="url"></c:url>
					<a href="${url }" class="btn btn-primary">Continue shopping</a>


					<c:url value="/checkout" var="url"></c:url>
					<a href="${url}" class="btn btn-primary btn-lg pull-right">Checkout
					</a>


				</div>
			</div>
		</div>
	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>
