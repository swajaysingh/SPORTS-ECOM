<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<style>
  body{        
        padding-bottom: 100px;
      }
</style>
</head>
<body>

<form action = "invoiceProcess" method = "post">
<div class="container">
<div class = "row">
<div class = "col-sm-6">
<div class="panel panel-default">

<div class="panel-heading">Customer Shipping Address</div>


<div class="panel-body">
<table>
<tr>
<td>CustomerName:</td>
<td>${Customer.customerName}</td>
</tr>
<tr>
<td>Email:</td>
<td>${Customer.customerEmail}</td>
</tr>
<tr>
<td>Phone:</td>
<td>${Customer.customerPhone }</td>
</tr>
<tr>
<td>Shipping Address:</td>
<tr>
<td>Apartment:</td>
<td>${Customer.shippingAddress.apartmentNumber}</td></tr>
<tr>
<td>city:</td>
<td>${Customer.shippingAddress.city}</td>
</tr>
<tr>
<td>country:</td>
<td>${Customer.shippingAddress.country}</td>
</tr><tr>
<td>state:</td>
<td>${Customer.shippingAddress.state}</td>
</tr><tr>
<td>streetName:</td>
<td>${Customer.shippingAddress.streetName}</td>
</tr><tr>
<td>zipcode:</td>
<td>${Customer.shippingAddress.zipcode}</td>
</tr>
</table>
</div>
<div class = "panel-footer">
<div class = "panel-heading">Billing Address</div>
<div class="panel-body">
<table>
<tr>
<td>CustomerName:</td>
<td>${Customer.customerName}</td>
</tr>
<tr>
<td>Email:</td>
<td>${Customer.customerEmail}</td>
</tr>
<tr>
<td>Phone:</td>
<td>${Customer.customerPhone }</td>
</tr>
<tr>
<td>Billing Address:</td>
<tr>
<td>Apartment:</td>
<td>${Customer.billingAddress.apartmentNumber}</td></tr>
<tr>
<td>city:</td>
<td>${Customer.billingAddress.city}</td>
</tr>
<tr>
<td>country:</td>
<td>${Customer.billingAddress.country}</td>
</tr><tr>
<td>state:</td>
<td>${Customer.billingAddress.state}</td>
</tr><tr>
<td>streetName:</td>
<td>${Customer.billingAddress.streetName}</td>
</tr><tr>
<td>zipcode:</td>
<td>${Customer.billingAddress.zipcode}</td>
</tr>
</table>
</div>
</div>

</div>
</div>
<div class="col-sm-6">
<div class = "panel panel-default">
<div class = "panel-heading">Payment</div>
<div class = "panel-body">
<h3><strong>Enter Card Details</strong></h3>
<input type = "hidden" name = "total" value = "${gtotal}">
<br>
<select name = "payment" id = "payment" onChange = "changed();">
<option value = "COD">Cash on delivery</option>
<option value = "NB">Net Banking</option>
<option value = "Debit/Credit">Debit or Credit</option>
</select>
<br>
<br>
<input id = "cardNo" type = "text" name = "cardNumber" placeholder = "Enter Card Number"/>
<br>
<br>
<input id = "cardNm" type = "text" name = "caedName" placeholder = "Enter Card Holder Name"/>
<table>
<tr>
<th colspan = "2">Expiry Date</th>
<th>&nbsp;&nbsp;</th>
<th>CVV</th>
</tr>
<tr>
<td colspan = "2">
<input id = "mon" type = "number" min = "1" max = "12" name = "month" placeholder = "MM">
<input id = "yr"type = "number" min = "00" max = "99" name = "year" placeholder = "YY">
</td>
<td>&nbsp;&nbsp;</td>
<td><input id = "cvv"type = "password" min = "000" max = "999" name = "CVV" placeholder = "CVV"></td>
<br>
<br>
</tr>
</table>
<br>
<input type = "submit" value = "Proceed">
</div>
</div>
</div>
</div>
</div>
</form>
<script type="text/javascript">
function changed()
{
  if(document.getElementById("payment").value === "COD")	
	  {
	    document.getElementById("cardNo").disabled ='true';
	    document.getElementById("cardNm").disabled ='true';
	    document.getElementById("mon").disabled ='true';
	    document.getElementById("yr").disabled ='true';
	    document.getElementById("cvv").disabled ='true';
	  }
  else if(document.getElementById("payment").value === "NB")
  {
	    document.getElementById("cardNo").disabled ='';
	    document.getElementById("cardNm").disabled ='';
	    document.getElementById("mon").disabled ='';
	    document.getElementById("yr").disabled ='';
	    document.getElementById("cvv").disabled ='';
	  }
  else if(document.getElementById("payment").value === "Debit/Credit")
	  {
	  document.getElementById("cardNo").disabled ='';
	    document.getElementById("cardNm").disabled ='';
	    document.getElementById("mon").disabled ='';
	    document.getElementById("yr").disabled ='';
	    document.getElementById("cvv").disabled ='';
	  }
    
}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>