<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="spr"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/registration.css ">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
<form action="/ack" class="form-horizontal">
<fieldset>
<div class="form-group">
<label class="col-sm-4 control-label" for="username">Customer Name</label>
<div class="col-sm-4">
<label class="col-sm-4 control-label" for="username">${userDetails.name}</label>
</div>
</div>

<div class="form-group">
<label class="col-sm-4 control-label" for="email">Customer Email</label>
<div class="col-sm-4">
<label class="col-sm-4 control-label" for="email">${userDetails.userMailId}</label>
</div>
</div>

<div class="form-group">
<label class="col-sm-4 control-label" for="address">Customer Address</label>
<div class="col-sm-4">
<label class="col-sm-4 control-label" for="address">${userDetails.address}</label>
</div>
</div>

<div class="form-group">
<label class="col-sm-4 control-label" for="deliverydate">Delivery Date</label>
<div class="col-sm-4">
<label class="col-sm-4 control-label" for="deliverydate">Within 7 working days.</label>
</div>
</div>

<div class = "container">
<div class = "row">

<div class = "panel panel-default">
<div class = "panel-heading text-center">ITEM(S)</div>

<div class = "panel-body">
<table class="table table-striped">
<tr>
<th>Items Ordered</th>
<th>QTY.</th>
<th>PRICE</th>
</tr>
<c:set var = "gtotal" value = "0"></c:set>
<c:forEach items = "${ Cart}" var = "c">
<tr><td>
${c.cartProdName}
</td>
<td>${c.cartQnty}.PC(S)</td>
<td>${c.cartPrice}</td>
<c:set var = "gtotal" value = "${gtotal + c.cartPrice + c.cartQnty}"></c:set>
</tr>
</c:forEach>
<tr><th>GRAND TOTAL</th>
<td>&nbsp;</td>
<th>${gtotal}</th>
</tr>

</table>
</div>
</div>
</div>
</div>

<div class="form-group">
<label class="col-sm-4 control-label" for="submit"></label>
<div class="col-sm-4">
<button type="submit" name="checkoutclick" class="btn btn-lg">Place Order</button>
</div>
</div>



</fieldset>

</form>

</div>


</body>
</html>