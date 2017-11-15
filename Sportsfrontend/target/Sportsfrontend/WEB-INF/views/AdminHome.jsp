<%@ page language="java" contentType="text/html" import="com.model.Category"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">                
  		<ul class="nav nav-pills nav-stacked" role="tablist" style="line-height:35px; height:140px;line-width:290px;width:200px;padding-top: 100px;" > 		
    	
    		<li class="active"><a href="category">Category</a></li>
    		<li><a href="supplier">Supplier</a></li>
    		<li><a href="product">Product</a></li>   
    		     
  		</ul>
	</div>
</body>
</html>
