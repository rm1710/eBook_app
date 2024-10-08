<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DAO.*" %>
<%@page import="com.DB.*" %>
<%@page import="com.entity.*" %>
<%@page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.card-body {
    transition: transform 0.3s ease-in-out;
}

.table {
    transform: scale(1);
    transition: transform 0.3s ease-in-out;
}


.card-body {
    margin: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
}

.table {
    width: 100%;
}

th, td {
    text-align: center;
}

tr {
    transition: transform 0.3s ease-in-out;
}

tr:hover {
    background-color: #e0f7fa;
    color: #333;
    transform: scale(1.05);
}

</style>
</head>
<body style="background-color: #e0f7fa;">
	<%@include file="all_component/navbar.jsp"%>
	
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty OrfailedMsg }">
		<h4 class="text-center text-danger">${OrfailedMsg}</h4>
		<c:remove var="OrfailedMsg" scope="session" />
	</c:if>
	
	
	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<div class="card bg-white mt-4">
					<div class="card-body p-2">
						<h3 class="text-center text-Dark">Your Cart Books</h3>
						<table class="table table-light table-striped">

							<thead>
								<tr style="tranform:none;">
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u=(User)session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DBconnect.getconn());
								List<Cart> cart=dao.getBookByUser(u.getId());
								Double totalPrice=0.0;
								for(Cart c:cart){
									totalPrice=c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName() %></th>
									<td><%=c.getAuthor() %></td>
									<td><%=c.getPrice() %></td>
									<td>
									<a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId() %>&&cid=<%=c.getCid() %>" class="btn btn-sm btn-danger" id="click">Remove</a>
									</td>
								</tr>
								<%
								} 
								%>
								<tr>
									<td>Total Price</th>
									<td></td>
									<td></td>
									<td><i class="fa-solid fa-indian-rupee-sign"></i><%=totalPrice %></td>
								</tr>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card mt-4">
					<div class="card-body">
						<h3 class="text-center">Enter Details for Order</h3>
						<form action="order" method="post">
						<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4" id="fo">Name</label> <input type="text"
										class="form-control" id="box" name="uname" value="${userobj.name }" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4" class="fo">Email</label> <input type="email"
										class="form-control" id="box" name="email" value="${userobj.email }" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4" class="fo">Mobile No.</label> <input
										type="number" class="form-control" id="box" name="phno"
										value="${userobj.phno }" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4" id="fo">Address</label> <input type="text"
										class="form-control" id="box" placeholder="Address" name="address" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4" id="fo">Landmark</label> <input type="text"
										class="form-control" id="box" placeholder="Landmark" name="lm" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4" id="fo">District</label> <input type="text"
										class="form-control" id="box" placeholder="District" name="dist" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4" id="fo">State</label> <input type="text"
										class="form-control" id="box" placeholder="State" name="state"required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4" id="fo">Pincode</label> <input
										type="number" class="form-control" id="box" name="pincode"
										placeholder="Pincode" required>
								</div>

								
								<div class="form-group col-md-12">
									<label id="fo">Payment Mode</label>
									<select id="box" class="form-control" name="payment">
										<option value="noselect">--Select--</option>
										<option value="COD">Cash on Delivery</option>
										<option value="Card Payment">Card Payment</option>
									</select>
								</div>
								
								<div class="btn-center">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-warning" id="click" >Order Now</button>&nbsp;
									<a href="index.jsp" class="btn btn-success" id="click">Continue shopping</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>