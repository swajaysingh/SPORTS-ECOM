

<%@ page language="java" contentType="text/html"
	import="com.model.Category"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="header.jsp"%>
<html>
<head>
<!-- DC Table Styles I CSS -->
<link type="text/css" rel="stylesheet"
	href="http://cdn.dcodes.net/2/tables1/css/dc_tables1.css" />
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<title>Category-Sports</title>

<style type="text/css">
body { background:#dbdbdb url('http://cdn.dcodes.net/2/bg_images/color/c29.jpg') no-repeat center top; }
</style>
</head>
<body>
	<center>
		<h2>Manage Category</h2>

		<security:authorize access="hasRole('ROLE_ADMIN')">

			<a href="createCategory" class="btn btn-primary" role="button">Add
				Category</a>
		</security:authorize>

	</center>



	<center>
		<table class="dc_table_s3" style="width: 80%">
			<thead>
				<tr>
					        
					<th scope="col">Category ID</th>         
					<th scope="col">Category Name</th>         
					<th scope="col">Category Description</th>         
					<th scope="col">Operations</th>       
				</tr>
				    
			</thead>

			<c:forEach items="${categoryList}" var="category">
				<tr bgcolor="cyan">
					<td align="center">${category.catId}</td>
					<td align="center">${category.catName}</td>
					<td align="center">${category.catDesc}</td>


					<td><security:authorize access="hasRole('ROLE_ADMIN')">
							<a href="<c:url value="deleteCategory/${category.catId}"/>">DELETE</a>/
			<a href="<c:url value="updateCategory/${category.catId}"/>">UPDATE</a>
						</security:authorize></td>
				</tr>
			</c:forEach>

		</table>
	</center>

</body>
</html>