<%@ page language="java" contentType="text/html"
	import="com.model.Supplier"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="header.jsp"%>
<html>
<head>
<!-- DC Table Styles I CSS -->
<link type="text/css" rel="stylesheet"
	href="http://cdn.dcodes.net/2/tables1/css/dc_tables1.css" />

<title>Supplier-SPORTS</title>
<style type="text/css">
body { background:#dbdbdb url('http://cdn.dcodes.net/2/bg_images/color/c29.jpg') no-repeat center top; }
</style>
</head>
<body>
	<center>
		<h2>Manage Supplier</h2>

		<security:authorize access="hasRole('ROLE_ADMIN')">

			<a href="createSupplier" class="btn btn-primary" role="button">Add
				Supplier</a>
		</security:authorize>


	</center>

	<center>
		<table class="dc_table_s3" style="width: 80%">
			<thead>
				      
				<tr>
					        
					<th scope="col">Supplier ID</th>         
					<th scope="col">Supplier Name</th>         
					<th scope="col">Supplier Address</th>         
					<th scope="col">Operation</th>       
				</tr>
				    
			</thead>



			<c:forEach items="${supplierList}" var="supplier">
				<tr bgcolor="cyan">
					<td align="center">${supplier.supplierId}</td>
					<td align="center">${supplier.supplierName}</td>
					<td align="center">${supplier.supplierAddress}</td>
					<td><a
						href="<c:url value="deleteSupplier/${supplier.supplierId}"/>">DELETE</a>/
						<a href="<c:url value="updateSupplier/${supplier.supplierId}"/>">UPDATE</a>
					</td>
				</tr>
			</c:forEach>

		</table>
	</center>
</body>
</html>