<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<div class="container">
<div class="page-header">
<br>
</div>
<div class="container">

<div class="row">
<div class="col-md-6">
<div class="panel with nav-tabs panel-primary">
<div class="panel-heading">
<ul class="nav nav-tabs">
<li class="active"><a href="#tab1prime" data-toggle="tab">Category</a></li>
<li><a href="#tab2prime" data-toggle="tab">Supplier</a></li>
<li><a href="#tab3prime" data-toggle="tab">Products</a></li>
</ul>
</div>

<div class="panel-body">
<div class="tab-content">
<div class="tab-pane fade in active" id="tab1prime">

<form method="post" action="<c:url value="/saveCategory"/>"class="form-signin">
<span id="reuth-email" class="reuth-email"></span>
<h3 class="input-title">CategoryID</h3>
<input class="form-control" type="number" name="catId" required/>
<h3 class="input-title">Category Name</h3>
<input class="form-control" type="text" name="catName" required/>
<button class="btn btn-lg btn-primary" type="submit">Save</button>
<button class="btn btn-lg btn-primary" type="reset">Cancel</button>
</form>

<div class="tab-pane fade" id="tab2prime">

<form method="post" action="<c:url value="/saveSupplier"/>"class="form-signin">
<span id="reuth-email" class="reuth-email"></span>
<h3 class="input-title">supplierID</h3>
<input class="form-control" type="number" name="supplierId" required/>
<h3 class="input-title">supplier Name</h3>
<input class="form-control" type="text" name="supplierName" required/>
<button class="btn btn-lg btn-primary" type="submit">Save</button>
<button class="btn btn-lg btn-primary" type="reset">Cancel</button>
</form>

<div class="tab-pane fade" id="tab3prime">

<form method="post" action="<c:url value="/saveProduct"/>"class="form-signin" enctype="multipart/form-data">
<span id="reuth-email" class="reuth-email"></span>

<h3 class="input-title">product Name</h3>
<input type="text" name="productName" required/><br>

<h3 class="input-title">product Stock</h3>
<input type="text" name="stock" required/>

<h3 class="input-title">product Description</h3>
<input type="text" name="productDesc" required/>

<h3 class="input-title">product Price</h3>
<input type="text" name="price" required/>

<div class="form-group">
<h4>Select Category</h4><br>
<select class="form-control" name="pCat" required>
<option value="">----Category choices------------------</option>
<c:forEach items="${categoryList}" var="category">
<option value="${category.catId }">${category.catName }</option></c:forEach>
</select>

</div>

<div class="form-group">
<h4>Select supplier</h4><br>
<select class="form-control" name="pSup" required>
<option value="">-------Supplier choices--------------</option>
<c:forEach items="${supplierList}" var="supplier">
<option value="${supplier.supplierId }">${supplier.supplierName}</option></c:forEach>
</select>
</div>
<br>
<div class="fileinput fileinput-new" data-provides="fileinput">
<tr>
<td> Image</td>
<td><input class="form-control" type="file" name="file" accept="image/*"></td>
</tr>


</div>

<button class="btn btn-lg btn-primary" type="submit">Save</button>
<button class="btn btn-lg btn-primary" type="reset">Cancel</button>
</form>
</div>
</div>



</div>
</div>
</div>
</div>
</div>
</div>
</div>

</body>
</html>