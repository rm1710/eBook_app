<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f3e5f5;">
<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
					<div class="card-body">
					<h4 class="text-center">Edit Profile</h4>
					
						<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg }">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form action="update_profile" method="post">
							  <input type="hidden" value="${userobj.id }" name="id">
                              <div class="mb-3">
                                  <label for="exampleInputEmail1" class="form-label">Enter Full Name</label> 
                                  <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname" value="${userobj.name }">
                              </div>

                              <div class="mb-3">
                                  <label for="exampleInputEmail1" class="form-label">Email address</label> 
                                  <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email" value="${userobj.email }">
                              </div>

                              <div class="mb-3">
                                  <label for="exampleInputEmail1" class="form-label">Mobile No.</label> 
                                  <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="phno" value="${userobj.phno }">
                              </div>

                              <div class="mb-3">
                                  <label for="exampleInputPassword1" class="form-label">password</label>
                                  <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
                              </div>
                              <div class="text-center p-2">
                              <button type="submit" class="btn btn-primary btn-block btn-sm" id="click">Update</button>
                              </div>
                          </form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="mt-4"><%@include file="all_component/footer.jsp"%></div>
</body>
</html>