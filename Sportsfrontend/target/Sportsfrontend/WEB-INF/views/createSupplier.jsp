<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- DC Table Styles I CSS -->
<link type="text/css" rel="stylesheet"
	href="http://cdn.dcodes.net/2/tables1/css/dc_tables1.css" />
	<style type="text/css">
body { background:#dbdbdb url('http://cdn.dcodes.net/2/bg_images/color/c29.jpg') no-repeat center top; }
</style>
</head>
<body>
<form:form action="AddSupplier" modelAttribute="supplier">
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
		<%-- <td><form:input path="supplierName" class="form-control"></form:input></td> --%>
	<td><form:errors path="supplierName" /></td>
	</tr>
	<tr>
		<td><h4>Supplier Address</h4></td>
		<td><form:textarea path="supplierAddress"/></td>
		<%-- <td><form:input path="supplierAddress" class="form-control"></form:input></td> --%>
		<td><form:errors path="supplierAddress" /></td>
	</tr>
	
	
	<tr>
		<td colspan="2">
			<center><input type="submit" value="Add Supplier"/></center>
		</td>
	</tr>
</table>
</form:form>

</body>
</html>