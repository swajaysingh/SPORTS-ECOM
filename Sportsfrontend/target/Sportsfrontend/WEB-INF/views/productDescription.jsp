<%@ page language="java" contentType="text/html"
	import="com.model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html >
<html>
<head>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title>Product-Sports</title>
<script src="<c:url value="/resources/js/controller.js" /> "></script>
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
	<div class="bg-img">
		<div class="container-fluid ">


			<div
				class="productdetails col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1">
				<div data-ng-app="myapp">
					<div>
						<div class="col-md-10">
						
							<c:url value="/resources/images/${product.productId}.jpg"
								var="url" />
							<div class="productimage">
								<img class="img-responsive col-md-8 col-md-offset-2" id="myImg"
									src="${url }" align="left" width: 10%" />
							
							</div>
						</div>

						<div data-ng-controller="productController">
							<div class="addcarticon">



								
									<a href="" data-ng-click="addToCart(${product.productId})"
										class=" btn btn-info btn-lg"> <span
										class="glyphicon glyphicon-shopping-cart"></span>Add to Cart
									</a>


								</div>
							</div>
						</div>

						<div class="details">
							<h4>Product</h4>
							with ID ${product.productId}<br /> <br /> <br />
							${product.productName }<br /> <br /> Supplied by <b>
								${product.supplier.supplierName}</b>



							<h4>Price</h4>
							${product.price} <br /> <br />

							<h4>Stock</h4>
							${product.stock} <br /> <br />


							<h4>Description</h4>
							${product.productDesc} <br /> <br />

							<h4>Category</h4>
							${product.category.catName} <br /> <br />


						</div>
						<div>
							<a href="<c:url value="/getAllproducts"></c:url>"
								class="btn btn-info btn-lg">Back</a>
						</div>
					</div>
				</div>
			</div>
		</div>

</body>
</html>