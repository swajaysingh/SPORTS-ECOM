<%@ page language="java" contentType="text/html" import="com.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@ include file="header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<title>Product-Sports</title>
<!-- DC Table Styles I CSS -->
<link type="text/css" rel="stylesheet"
	href="http://cdn.dcodes.net/2/tables1/css/dc_tables1.css" />
	<style type="text/css">
body { background:#dbdbdb url('http://cdn.dcodes.net/2/bg_images/color/c29.jpg') no-repeat center top; }
</style>
</head>
<body>
	
	 
	
	<h1>Sign up</h1>
	<div class="col-lg-12">
		<div class="row">
			<spring:form modelAttribute="user" action="saveRegister" method="post">
				<div class="col-lg-10">
					<div class="form-group">
						<label>Email Id</label>
						<spring:input path="email" placeholder="Enter mail Id" class="form-control" />
						<spring:errors path="email"></spring:errors>
					</div>
				</div>
				<div class="col-lg-10">
					<div class="form-group">
						<label>Name</label>
						<spring:input path="userName" placeholder="Enter name" class="form-control" />
						<spring:errors path="userName"></spring:errors>
					</div>
				</div>
				<div class="col-lg-10">
					<div class="form-group">
						<label>Address</label>
						<spring:input path="userAddress" placeholder="Enter address" class="form-control" />
						<spring:errors path="userAddress"></spring:errors>
					
					</div>
				</div>
				<div class="col-lg-10">
					<div class="form-group">
						<label>Contact Number</label>
						<spring:input path="userContact" placeholder="Enter contact number" class="form-control" />
						<spring:errors path="userContact"></spring:errors>
					</div>
				</div>
				<div class="col-lg-10">
					<div class="form-group">
						<label>Password</label>
						<spring:input path="password" placeholder="Enter password" class="form-control" />
						<spring:errors path="password"></spring:errors>
					</div>
				</div>
				<button type="submit" class="btn btn-lg btn-info">Submit</button>
				<button type="reset" class="btn btn-lg btn-info">Cancel</button>
			</spring:form>
		</div>
	</div>
</body>
</html>