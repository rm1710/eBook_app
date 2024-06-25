<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.DAO.*" %>
<%@page import="com.DB.*" %>
<%@page import="com.entity.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Razorpay Integration</title>
    <%@include file="all_component/allCss.jsp"%>
    <style>
        body {
            background-color: #dcedc8;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
        }

        .card {
            border: none;
            border-radius: 1px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-title {
            font-size: 1.5rem;
            color: #007bff;
        }

        .form-group {
            margin-bottom: 20px;
        }
        .form-control {
            border:solid;
            border-radius:1px;
        }

        #rzp-button {
            background-color: #007bff;
            border: solid;
            padding: 10px 20px;
            color: #fff;
            border-radius: 1px;
            cursor: pointer;
        }

        #payment-status {
            margin-top: 20px;
        }

        .card-icons {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }

        .card-icon {
            width: 40px;
            height: auto;
            opacity: 0.5;
        }

        .card-icon.active {
            opacity: 1;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <div class="card-body">
            <h2 class="card-title text-center mb-4"><b>Secure Payment with Razorpay</b></h2>
			<%
			User u=(User)session.getAttribute("userobj");
			CartDAOImpl dao = new CartDAOImpl(DBconnect.getconn()); 
			Double totalPrice=0.0;
			List<Cart> cart=dao.getBookByUser(u.getId());
			for(Cart c:cart){
				totalPrice=c.getTotalPrice();
			%><%} %>
            <!-- User Details Form -->
            <form id="payment-form" method="get" action="cardpayment"> 
                <div class="form-group">
                    <label for="amount"><b>Amount (INR)</b></label>
                    <div class="input-group">
                     <div class="input-group-prepend">
                            <span class="input-group-text">&#8377;</span> <!-- Rupee symbol -->
                       </div>
                    <input type="number" class="form-control" id="amount" placeholder="Enter amount" readonly name="amt" value="<%=totalPrice %>">
                    </div>
                </div>

                <div class="form-group">
                    <label for="name"><b>Card Holder Name</b></label>
                    <input type="text" class="form-control" id="name" placeholder="Enter your name" name="chn" required>
                </div>
                
                <div class="form-group">
                    <label for="cardNumber"><b>Card Number</b></label>
                    <input type="text" class="form-control" id="cardNumber" placeholder="Enter card number" name="cn" maxlength="16" required>
                </div>
                <div class="row">
                <div class="form-group col-md-6">
                    <label for="cardNumber"><b>CVV</b></label>
                    <input type="password" class="form-control" id="cardNumber" placeholder="Enter CVV" name="cvv" maxlength="3" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="cardNumber"><b>Expiry Date</b></label>
                    <input type="text" class="form-control" id="cardNumber" name="ed" placeholder="MM/YY" pattern="\d{2}/\d{2}" required>
                </div>
                </div>
                <div class="card-icons">
                	<img src="img/rupay.png" alt="Rupay" height="90px" width="80px">
                    <img src="img/mc.png" alt="MasterCard" height="60px" width="80px">
                    <img src="img/ax.png" alt="Visa" height="80px" width="80px">
                </div>
<hr>
				<div class="row">
	                <div class="form-group col-md-6">
						<label for="inputPassword4"><b>Email</b></label> <input type="email"  name="em"placeholder="Enter Email" class="form-control" id="inputPassword4" required>
					</div>
					
					<div class="form-group col-md-6">
						<label for="inputEmail4"><b>Mobile No.</b></label> <input
							type="tel" class="form-control" name="mob" id="inputEmail4" placeholder="Enter Mobile No.">
					</div>
				</div>
                <button type="submit" class="btn btn-primary btn-block mt-3" id="rzp-button">Pay Now</button>
            </form>
            <div id="payment-status" class="mt-4"></div>
        </div>
    </div>
</div>

