<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body>
	<%@include file="all_component/navbar.jsp" %>
	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Successfully</h2>
		<h5>With in 7 days your Book will be Delivered In your Address</h5>
		<a href="index.jsp" class="btn btn-primary mt-3" id="click">Home</a>
		<a href="order.jsp" class="btn btn-danger mt-3" id="click">View Order</a>
	</div>
</body>
</html>