<%@ page language="java" contentType="text/html"
	import="com.model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<title>Product-Sports</title>
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
<center>
	<form:form method="post" action="${pageContext.request.contextPath}/UpdateProduct"
		commandName="editProductObj">
			<table>
			<tr>
				<td><form:label path="productId">Product Id</form:label></td> 
				<td><form:input path="productId" class="form-control" disabled="true"></form:input></td>
				<td><form:hidden path="productId" /></td>
			</tr>
			<tr>
				<td><form:label path="productName">Product Name</form:label></td>
				<td><form:input path="productName" class="form-control"></form:input></td>
				<td><form:errors path="productName" /></td>
			</tr>

			<tr>
				<td><form:label path="price">Product Price</form:label></td>
				<td><form:input path="price" class="form-control"></form:input></td>
				<td><form:errors path="price" /></td>
			</tr>

			<tr>
				<td><form:label path="productDesc">Product Description</form:label></td>
				<td><form:input path="productDesc" class="form-control"></form:input></td>
				<td><form:errors path="productDesc" /></td>
			</tr>
			<tr>
				<td><form:label path="stock">Stock</form:label></td>
				<td><form:input path="stock" class="form-control"></form:input></td>
				<td><form:errors path="stock" /></td>
			</tr>
			<tr>
				<td><form:label path="supplier">Supplier List
						<spring:message text="Supplier" />
					</form:label></td>
				<td><form:select path="supplier.supplierName"
						items="${supplierList}" itemValue="supplierName" itemLabel="supplierName"
						class="form-control" /></td>
			</tr>
			<tr>
				<td><form:label path="category">Category List
						<spring:message text="Category" />
					</form:label></td>
				<td><form:select path="category.catName"
						items="${categoryList}" itemValue="catName" itemLabel="catName"
						class="form-control" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Update Product"
					class="btn btn-default"></td>
			</tr>
		</table>
	</form:form>

</center>



</body>
</html>