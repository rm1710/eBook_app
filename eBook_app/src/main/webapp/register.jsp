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
                height: 91vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="reg-img">
            <div class="container pt-3">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
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
                                        <label for="exampleInputEmail1" class="form-label">Enter Full Name</label> 
                                        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label> 
                                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Mobile No.</label> 
                                        <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="phno">
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
                                    </div>

                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check"> 
                                        <label class="form-check-label" for="exampleCheck1">Agree terms & condition</label>
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
        <%@include file="all_component/footer.jsp" %>
    </body>
</html>