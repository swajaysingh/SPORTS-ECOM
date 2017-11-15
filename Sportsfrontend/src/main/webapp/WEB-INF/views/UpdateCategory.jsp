<%@ page language="java" contentType="text/html" import="com.model.Category"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file="header.jsp"%>
<html>
<head>
<title>Category-FashionFrontend</title>
<!-- DC Table Styles I CSS -->
<link type="text/css" rel="stylesheet"
	href="http://cdn.dcodes.net/2/tables1/css/dc_tables1.css" />
	<style type="text/css">
body { background:#dbdbdb url('http://cdn.dcodes.net/2/bg_images/color/c29.jpg') no-repeat center top; }
</style>
</head>
<body>


<form:form action="${pageContext.request.contextPath}/UpdateCategory" modelAttribute="category" method="post">

<table align="center" cellspacing="2">
	<center>
		<h2>Category Module</h2>
	</center>
	<tr>
		<td><h4>Category ID</h4></td>
		<!--<td><input type="text" name="catId"/></td>-->
		<td><form:input path="catId"/></td>
	</tr>
	<tr>
		<td><h4>Category Name</h4></td>
		<!-- <td><input type="text" name="catName"/></td> -->
		<td><form:input path="catName"/></td>
	</tr>
	<tr>
		<td><h4>Category Desc</h4></td>
		<!-- <td><input type="text" name="catDesc"/></td> -->
		<td><form:input path="catDesc"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<center><input type="submit" value="Update Category"/></center>
		</td>
	</tr>
</table>

</form:form>

<%-- <table cellspacing="2" align="center">
<tr bgcolor="gray">
	<td>Category ID</td>
	<td>Category Name</td>
	<td>Category Description</td>
	<td>Operation</td>
</tr>
<c:forEach items="${categoryList}" var="category">
	<tr bgcolor="cyan">
		<td>${category.catId}</td>
		<td>${category.catName}</td>
		<td>${category.catDesc}</td>
		<td>
			<a href="<c:url value="deleteCategory/${category.catId}"/>">DELETE</a>/
			<a href="<c:url value="updateCategory/${category.catId}"/>">UPDATE</a>
		</td>
	</tr>
</c:forEach> --%>
<!-- 
</table> -->

</body>
</html>