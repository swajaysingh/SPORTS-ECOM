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
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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

	<form:form action="AddCategory" modelAttribute="category" >


		<table align="center" cellspacing="2">
			<center>

				<h2>
					<!-- <td colspan="2"> -->
					Category Module
					<!-- </td> -->
				</h2>

			</center>
			<tr>
				<td><h4>Category ID</h4></td>
				<td><form:input path="catId" /></td>
			</tr>
			<tr>
				<td><h4>Category Name</h4></td>
				<td><form:input path="catName" /></td>
				<%-- <td><form:input path="catName" class="form-control"></form:input></td> --%>
				<td><form:errors path="catName" /></td>
			</tr>
			<tr>
				<td><h4>Category Description</h4></td>
				<td><form:input path="catDesc" /></td>
				<%-- <td><form:input path="catDesc" class="form-control"></form:input></td> --%>
				<td><form:errors path="catDesc" /></td>
			</tr>
			<tr>
				<td colspan="2"><security:authorize
						access="hasRole('ROLE_ADMIN')">
						<center>

							<input type="submit" value="Add Category" />
							
						</center>
					</security:authorize></td>
			</tr>
		</table>
	</form:form>


</body>
</html>