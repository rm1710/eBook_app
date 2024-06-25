<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f8bbd0">
	<%@include file="all_component/navbar.jsp" %>
	<div class="container text-center mt-3">
								<c:if test="${not empty OrfailedMsg }">
                                    <h3 class="text-center text-danger">${OrfailedMsg}</h3>
                                    <c:remove var="OrfailedMsg" scope="session" />
                                </c:if>
                                
                                <c:if test="${not empty OrsuccMsg }">
                                    <h1 class="text-center text-success">${OrsuccMsg}</h1>
                                    <c:remove var="OrsuccMsg" scope="session" />
                                </c:if>
		<c:if test="${not empty cardpay }">
			<h1 class="text-center text-info">${cardpay}</h1>
			<c:remove var="cardpay" scope="session" />
		</c:if>
		<a href="index.jsp" class="btn btn-primary mt-3" id="click">Continue Shopping</a>
		<a href="order.jsp" class="btn btn-danger mt-3" id="click">View Order</a>
	</div>
	<div style="margin-top:330px"><%@include file="all_component/footer.jsp" %></div>
</body>
</html>