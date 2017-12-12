<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
bg color dsajbjasbd**********
<form:form action="AddProduct" modelAttribute="product" enctype="multipart/form-data">
<table cellspacing="2" align="center">
<tr bgcolor="gray">
<!-- <td>Product Id</td> -->
<td>Product Name</td>
<td>Supplier</td>
<td>Price</td>
<td>Category</td>
<td>Stock</td>
<td>Description</td>
<td>Photo</td>
</tr>
<c:forEach items="${productList}" var="product">
<tr>
<%-- <td>${product.productId }</td> --%>
<td>${product.productName}</td>
<td>${product.supplierId }</td>
<td>${product.price}</td>
<td>${product.catId}</td>
<td>${product.stock}</td>
<td>${product.productDesc }</td>
<td><img width = "100px" height ="100px" src="<c:url value="/resources/images/${product.productId}.jpg"/> "/></td> 
<%-- <td><a href="<c:url value="/ProductDesc/${product.productId }"/>">DETAILS</a></td> --%>
<%-- <c:out value="/resources/images/${product.productId}.jpg"/>
<img src="<c:url value="/resources/images/${product.productId}.jpg"/>"> --%>



</tr>
</c:forEach>
</table>
</form:form>
</body>
</html>