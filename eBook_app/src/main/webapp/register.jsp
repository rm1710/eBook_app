<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Registration page</title>
        <%@include file="all_component/allCss.jsp" %>
        <style type="text/css">
            .reg-img {
                background: url("img/ebook1.jpg");
                height: 120vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .register-card {
        background-color: rgba(255, 255, 255, 0.8);
            border: solid 2px;
            border-radius: 1px;
        }
        </style>
        <script>
	        function limitDigits(input, maxLength) {
	            if (input.value.length > maxLength) {
	                input.value = input.value.slice(0, maxLength);
	            }
	        }
	        
	        function validatePassword(input) {
	            
	            var containsUppercase = /[A-Z]/.test(input.value);
	            var containsLowercase = /[a-z]/.test(input.value);
	            var containsNumber = /[0-9]/.test(input.value);
	            var containsSpecialChar = /[^A-Za-z0-9]/.test(input.value);
	            
	            if (containsUppercase && containsLowercase && containsNumber && containsSpecialChar && input.value.length >= 8) {
	                
	                input.setCustomValidity('');
	            } else {
	                
	                input.setCustomValidity('Password must contain at least 8 characters, including uppercase and lowercase letters, numbers, and special characters.');
	            }
	        }
	        
	        function toggleAnswerInput(questionIndex) {
	            var answerInput = document.getElementById("answer" + questionIndex);
	            if (answerInput.classList.contains("visible")) {
	                answerInput.classList.remove("visible"); // Hide answer input field
	            } else {
	                answerInput.classList.add("visible"); // Show answer input field
	            }
	        }
        </script>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="reg-img">
            <div class="container pt-3">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card register-card">
                            <div class="card-body">
                                <h4 class="text-center">Registration Page</h4>

                                <c:if test="${not empty succMsg }">
                                    <p class="text-center text-success">${succMsg}</p>
                                    <c:remove var="succMsg" scope="session"/>
                                </c:if>
                                <c:if test="${not empty failedMsg }">
                                    <p class="text-center text-danger">${failedMsg}</p>
                                    <c:remove var="failedMsg" scope="session"/>
                                </c:if>

                                <form action="register" method="post">

                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label" id="fo" >Enter Full Name</label> 
                                        <input type="text" class="form-control" id="box" aria-describedby="emailHelp" placeholder="Enter Name"required="required" name="fname">
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label" id="fo" >Email</label> 
                                        <input type="email" class="form-control" id="box" aria-describedby="emailHelp" placeholder="Enter Email"required="required" name="email">
                                    </div>

                                    <div class="mb-2">
                                        <label for="exampleInputEmail1" class="form-label" id="fo" >Mobile No.</label>
										<input type="tel" class="form-control" oninput="limitDigits(this, 10)" id="box" aria-describedby="emailHelp" placeholder="Enter Mobile No."required="required" name="phno">
                                    </div>

									<div class="mb-3">
										<label for="securityQuestion1" class="form-label" id="fo">Security
											Question</label> 
										<select class="form-control" id="securityQuestion1" name="question"style="border:solid; border-radius:1px"
											name="securityQuestion1" required
											onchange="toggleAnswerInput(1)">
											 	<option value="">Select Security Question</option>
											    <option value="What is your pet's name?">What is your pet's name?</option>
											    <option value="What is your mother's maiden name?">What is your mother's maiden name?</option>
											    <option value="What city were you born in?">What city were you born in?</option>
											    <option value="What is the name of your favorite teacher?">What is the name of your favorite teacher?</option>
											    <option value="What was your childhood nickname?">What was your childhood nickname?</option>
											    <option value="What is the name of the street you grew up on?">What is the name of the street you grew up on?</option>
											    <option value="What is your favorite movie?">What is your favorite movie?</option>
											    <option value="What is your favorite food?">What is your favorite food?</option>
											    <option value="What is the name of your best friend in high school?">What is the name of your best friend in high school?</option>
											    <option value="What is your favorite color?">What is your favorite color?</option>
										</select>
									</div>

									<div class="mb-3 answer-input" id="answer1">
										<input type="text" class="form-control" id="box"
											placeholder="Enter Answer" required="required" name="answer">
									</div>

									<div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label" id="fo" >password</label>
                                        <input type="password" class="form-control" id="box" oninput="validatePassword(this)" placeholder="Enter Password" required="required" name="password">
                                    </div>

                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check"> 
                                        <label class="form-check-label" for="exampleCheck1" id="fo" >Agree terms & condition</label>
                                    </div>
                                    <div class="text-center">
                                    <button type="submit" class="btn btn-primary" id="click">Register</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       <div style="margin-top:-5px"><%@include file="all_component/footer.jsp"%></div>
    </body>
</html>