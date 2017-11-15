<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- DC Table Styles I CSS -->
<link type="text/css" rel="stylesheet"
	href="http://cdn.dcodes.net/2/tables1/css/dc_tables1.css" />
<link type="text/css" rel="stylesheet"
	href="http://cdn.dcodes.net/2/tables1/css/dc_tables1.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
	background: #dbdbdb
		url('http://cdn.dcodes.net/2/bg_images/color/c29.jpg') no-repeat
		center top;
}
</style>
</head>
<body>
	<center>
		<h2>Manage Product</h2>

		<security:authorize access="hasRole('ROLE_ADMIN')">

			<a href="createProduct" class="btn btn-primary" role="button">Add
				Product</a>
		</security:authorize>


	</center>

	<form:form action="AddProduct" modelAttribute="product"
		enctype="multipart/form-data">
		<center>
			<table class="dc_table_s3" style="width: 80%">
				<thead>
					      
					<tr>
						       
						<th scope="col">Product Id</th> 
						<th scope="col">Product Name</th>
						<th scope="col">Supplier Name</th>    
						<th scope="col">Category Name</th>              
						<th scope="col">Price</th>            
						<th scope="col">Description</th>
						<th scope="col">Stock</th>
						<th scope="col">Photo</th>  
						<!-- <th scope="col">Operations</th> 
 -->
					</tr>
					    
				</thead>
				<c:forEach items="${productList}" var="product">
					<tr>
						<td align="center"><a
							href="getAllproducts/${product.productId}">${product.productId }</a></td>

						<td align="center">${product.productName}</td>
						<td align="center">${product.supplier.supplierName }</td>
						<td align="center">${product.category.catName }</td>
						<td align="center">${product.price}</td>
						<td align="center">${product.productDesc }</td>
						<td align="center">${product.stock }</td>

						<td align="center"><img width="100px" height="100px"
							src="<c:url value="/resources/images/${product.productId}.jpg"/> " /></td>

						<security:authorize access="hasRole('ROLE_ADMIN')">
							<td><a
								href="<c:url value="deleteProduct/${product.productId}"/>">DELETE</a>/
								<a href="<c:url value="updateProduct/${product.productId}"/>">UPDATE</a>
							</td>
						</security:authorize>
					</tr>
				</c:forEach>
			</table>
	</form:form>
	</center>
</body>
</html>