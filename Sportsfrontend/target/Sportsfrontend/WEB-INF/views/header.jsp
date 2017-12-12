<!DOCTYPE html>
<html lang="en">
<head>
<title>SPORTS</title>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Sports</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index"><span
							class="glyphicon glyphicon-home"></span> Home</a></li>
					<%-- <li><a href="<c:url value="/aboutUs"/> About us</a></li> --%>

					<li><a href="${pageContext.request.contextPath}/aboutUs">About
							Us</a></li>

					<c:if test="${pageContext.request.userPrincipal.name!=null}">
						<security:authorize access="hasRole('ROLE_ADMIN')">

							<li><a
								href="${pageContext.request.contextPath}/getAllcategories">Browse
									ALL Category</a></li>
							<li><a
								href="${pageContext.request.contextPath }/getAllsuppliers">Browse
									All Supplier</a></li>
							<li><a
								href="${pageContext.request.contextPath }/getAllproducts">Browse
									ALL Products</a></li>

						</security:authorize>
						<security:authorize access="hasRole('ROLE_USER')">
							<li><a
								href="${pageContext.request.contextPath }/getAllproducts">Browse
									ALL Products</a></li>
						</security:authorize>

						<security:authorize access="hasRole('ROLE_USER')">
							<li><a href="<c:url value="/cart/getCartId"></c:url>">Cart</a></li>
						</security:authorize>

						<li><a>Welcome ${pageContext.request.userPrincipal.name }</a></li>
						<li><a href="<c:url value="/j_spring_security_logout"/>">logout</a></li>
					</c:if>


				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${pageContext.request.userPrincipal.name==null}">
						<li><a href="${pageContext.request.contextPath }/login"><span
								class="glyphicon glyphicon-log-in"></span> Login</a></li>
						<c:url value="/customer/registration" var="url"></c:url>
						<li><a href="${url }">Register</a></li>

						<%-- <li><a href="${pageContext.request.contextPath }/register"><span
								class="glyphicon glyphicon-user"></span> Sign Up</a></li> --%>


					</c:if>





				</ul>
			</div>
		</div>
	</nav>
	
</body>
</html>





