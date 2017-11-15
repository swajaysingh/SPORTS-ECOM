<%@ page language="java" contentType="text/html" import="com.model.Supplier"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file="header.jsp"%>
<html>
<head>
<title>Supplier-FashionFrontend</title>
<!-- DC Table Styles I CSS -->
<link type="text/css" rel="stylesheet"
	href="http://cdn.dcodes.net/2/tables1/css/dc_tables1.css" />
	<style type="text/css">
body { background:#dbdbdb url('http://cdn.dcodes.net/2/bg_images/color/c29.jpg') no-repeat center top; }
</style>
</head>
<body>

<form:form action="${pageContext.request.contextPath}/UpdateSupplier" modelAttribute="supplier" method="post">

<table align="center" cellspacing="2">
	<center>
		<h2>Supplier Module</h2>
	</center>
	<tr>
		<td><h4>Supplier ID</h4></td>
		<td><form:input path="supplierId"/></td>
	</tr>
	<tr>
		<td><h4>Supplier Name</h4></td>
		<td><form:input path="supplierName"/></td>
	</tr>
	<tr>
		<td><h4>Supplier Address</h4></td>
		<td><form:textarea path="supplierAddress"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<center><input type="submit" value="Update Supplier"/></center>
		</td>
	</tr>
</table>
</form:form>
<%-- 
<table cellspacing="2" align="center">
<tr bgcolor="gray">
	<td>Supplier ID</td>
	<td>Supplier Name</td>
	<td>Supplier Address</td>
	<td>Operation</td>
</tr>
<c:forEach items="${supplierList}" var="supplier">
	<tr bgcolor="cyan">
		<td>${supplier.supplierId}</td>
		<td>${supplier.supplierName}</td>
		<td>${supplier.supplierAddress}</td>
		<td>
			<a href="<c:url value="deleteSupplier/${supplier.supplierId}"/>">DELETE</a>/
			<a href="<c:url value="updateSupplier/${supplier.supplierId}"/>">UPDATE</a>
		</td>
	</tr>
</c:forEach>

</table> --%>

</body>
</html>