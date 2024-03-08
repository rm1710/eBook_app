<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Login page</title>
        <%@include file="all_component/allCss.jsp" %>
        <style type="text/css">
            .log-img {
                background: url("img/ebook3.jpg");
                height: 75vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="log-img">
            <div class="row pt-4">
                <div class="col-md-4 offset-md-4">
                    <div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="text-center">Login</h5>

                                <c:if test="${not empty failedMsg }">
                                    <h5 class="text-center text-danger">${failedMsg}</h5>
                                    <c:remove var="failedMsg" scope="session" />
                                </c:if>
                                
                                <c:if test="${not empty succMsg }">
                                    <h5 class="text-center text-danger">${succMsg}</h5>
                                    <c:remove var="succMsg" scope="session" />
                                </c:if>



                                <form action="login" method="post">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email
                                            address</label> <input type="email" class="form-control"
                                                               id="exampleInputEmail1" aria-describedby="emailHelp"
                                                               required="required" name="email">
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input type="password" class="form-control"
                                               id="exampleInputPassword1" required="required" name="password">
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary" id="click">login</button>
                                        <br> <a href="register.jsp">Create Account</a>
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