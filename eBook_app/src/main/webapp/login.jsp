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
                height: 80vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
        .login-card {
        background-color: rgba(255, 255, 255, 0.8);
            border: solid 2px;
            border-radius: 1px;
        }
            
        </style>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="log-img">
            <div class="row pt-4">
                <div class="col-md-4 offset-md-4">
                        <div class="card login-card">
                            <div class="card-body">
								<center><i class="fa-solid fa-user fa-3x"></i></center>
                                <h3 class="text-center">Login</h3>

                                <c:if test="${not empty failedMsg }">
                                    <h4 class="text-center text-danger">${failedMsg}</h4>
                                    <c:remove var="failedMsg" scope="session" />
                                </c:if>
                                
                                <c:if test="${not empty Msg }">
                                    <h4 class="text-center text-danger">${Msg}</h4>
                                    <c:remove var="Msg" scope="session" />
                                </c:if>
                                
                                <c:if test="${not empty succMsg }">
                                    <h4 class="text-center text-success">${succMsg}</h4>
                                    <c:remove var="succMsg" scope="session" />
                                </c:if>



                                <form action="login" method="post">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label" id="fo" >Email
                                            address</label> <input type="email" class="form-control"
                                                               id="box" placeholder="Enter Email" aria-describedby="emailHelp"
                                                               required="required" name="email">
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label" id="fo" >Password</label>
                                        <input type="password" class="form-control" placeholder="Enter password"
                                               id="box" required="required" name="password">
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary" id="click">login</button>
                                        <br> <a href="forgetpasswd.jsp">Forgot Password</a>
                                        <br> <a href="register.jsp">Create Account</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <div class="p2"><%@include file="all_component/footer.jsp" %></div>
    </body>
</html>