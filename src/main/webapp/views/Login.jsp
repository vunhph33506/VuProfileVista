<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>VuProfileVista</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<link rel="stylesheet" href="bootstrap/css/style.css" />
</head>
<body class="img js-fullheight"
	style="background-image: url(bootstrap/images/bg.jpg)">
	<%
	String usernameParam = request.getParameter("username");
	String passwordParam = request.getParameter("password");

	// Check if username and password parameters are not null
	if (usernameParam != null && passwordParam != null) {
		// Set them as request attributes
		request.setAttribute("username", usernameParam);
		request.setAttribute("password", passwordParam);
	}
	%>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Login</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
						<h3 class="mb-4 text-center">Have an account?</h3>
						<form action="/VuProfileVista/login" method="post"
							class="signin-form">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Username"
									name="username" required value="${username }" />
							</div>
							<div class="form-group">
								<input id="password-field" type="password" class="form-control"
									placeholder="Password" name="password" required
									value="${password }" /> <span onclick="togglePassword()"
									class="fa fa-fw fa-eye field-icon toggle-password"></span>
							</div>

							<div class="form-group">
								<button type="submit"
									class="form-control btn btn-primary submit px-3">Sign
									In</button>
							</div>
							<c:if test="${not empty requestScope.loginFailed}">
								<div class="alert alert-danger" role="alert">Login failed.
									Please check your username and password.</div>
							</c:if>
							<div class="form-group d-md-flex">
								<div class="w-50">
									<label class="checkbox-wrap checkbox-primary">Remember
										Me <input type="checkbox" checked name="remember" /> <span
										class="checkmark"></span>
									</label>
								</div>
								<div class="w-50 text-md-right">
									<a href="#" style="color: #fff">Forgot Password</a>
								</div>
							</div>
						</form>
						<p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
						<div class="social d-flex text-center">
							<a href="https://www.facebook.com/NongHoangVu04"
								class="px-2 py-2 mr-md-1 rounded"><span
								class="ion-logo-facebook mr-2"></span> Facebook</a> <a
								href="https://www.google.com/login"
								class="px-2 py-2 ml-md-1 rounded"><span
								class="ion-logo-twitter mr-2"></span> Google</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		function togglePassword() {
			var passwordField = document.getElementById("password-field");
			var eyeIcon = document.querySelector(".toggle-password");

			if (passwordField.type === "password") {
				passwordField.type = "text";
				eyeIcon.classList.remove("fa-eye");
				eyeIcon.classList.add("fa-eye-slash");
			} else {
				passwordField.type = "password";
				eyeIcon.classList.remove("fa-eye-slash");
				eyeIcon.classList.add("fa-eye");
			}
		}
	</script>
	<script src="/bootstrap/js/jquery.min.js"></script>
	<script src="/bootstrap/js/popper.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
	<script src="/bootstrap/js/main.js"></script>
</body>
</html>
