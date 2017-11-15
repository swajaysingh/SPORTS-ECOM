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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Product-Sports</title>
</head>
<body>
	<%-- <jsp:include page="header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<a
						href="<c:url value="/resources/images/${product.productId}.jpg"/>">
						<img height="500px" width="500px"
						src="<c:url value="/resources/images/${product.productId}.jpg"/>" />
					</a>
				</div>
			</div>
			<div class="colmd-8">
				<pre>
<label><h1>
							<c:out value="${product.productName}">${product.productName}</c:out>
<small>Price- <c:out value="${product.price}">${product.price}</c:out>Rs.</small>
						</h1></label>




							<security:authorize access="hasRole('ROLE_USER')">
<form action="cart/${product.productId}" method='post'>
<h3>
							<label for="user">Quantity</label>
						</h3>
<input type="text" class="form-control" id="user" name="quantity">
<input type="submit" value="ADD TO CART">
</form>
						</security:authorize>
 </pre>
			</div>

		</div>
	</div>
 --%>





	<div class="bg-img">
		<div class="container-fluid ">


			<div
				class="productdetails col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1">

				<div>
					<c:url value="/resources/images/${product.productId}.jpg" var="url" />
					<div class="productimage">
						<img class="img-responsive col-md-8 col-md-offset-2" id="myImg"
							src="${url }" align="right" width: 10%" />
					</div>
					<div>
						<div class="addcarticon">


							<security:authorize access="hasRole('ROLE_USER')">
								<a href="" class=" btn btn-info btn-lg"> <span
									class="glyphicon glyphicon-shopping-cart"></span>Add to Cart
								</a>
							</security:authorize>

						</div>
					</div>
				</div>

				<div class="details">
					<h4>Product</h4>
					with ID ${product.productId}<br /> <br /> <br /> ${product.productName }<br />
					<br />  Supplied by <b> ${product.supplier.supplierName}</b>



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

</body>
</html>