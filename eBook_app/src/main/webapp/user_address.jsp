<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Address</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #c5cae9;">
<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body mt-3">
					<h3 class="text-center">Add Address</h3>
						<form action="">
						<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label> <input
										type="number" class="form-control" id="inputEmail4" placeholder="Address">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Landmark</label> <input type="text"
										class="form-control" id="inputPassword4" placeholder="Landmark">
								</div>
								</div>
								<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control" id="inputEmail4" placeholder="Landmark">
								</div>
								<div class="form-group col-md-3">
									<label for="inputPassword4">State</label> <input type="text"
										class="form-control" id="inputPassword4" placeholder="City">
								</div>
								<div class="form-group col-md-3">
									<label for="inputPassword4">Pincode</label> <input type="text"
										class="form-control" id="inputPassword4" placeholder="City">
								</div>
								</div>
								<div class="text-center">
									<button class="btn" id="click">Add Address</button>
								</div>
								
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top:70px"><%@include file="all_component/footer.jsp"%></div>
</body>
</html>