<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>User Management</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">

</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<div class="container mt-5">
		<div class="container mt-3">
			<a href="/VuProfileVista/login" class="btn btn-danger float-right">
				<i class="fas fa-sign-out-alt"></i> Logout
			</a>
		</div>
		<h2>User Management</h2>
		<!-- Form -->
		<form action="/VuProfileVista/user/home" method="post">
			<div class="form-row mt-3">
				<div class="form-group col-md-6">
					<label for="username">Username:</label> <input type="text"
						class="form-control" id="username" name="username" required
						value="${setName}">
				</div>
				<div class="form-group col-md-6">
					<label for="password">Password:</label> <input type="password"
						class="form-control" id="password" name="password" required
						value="${setPw}">
				</div>
				<div class="form-group col-md-6">
					<label for="email">Email:</label> <input type="email"
						class="form-control" id="email" name="email" required
						value="${setEmail}">
				</div>
				<div class="form-group col-md-6">
					<label for="fullName">Full Name:</label> <input type="text"
						class="form-control" id="fullName" name="fullName" required
						value="${setFullName}">
				</div>
			</div>
			<div class="btn-group mt-3">
				<button type="submit" class="btn btn-success"
					formaction="/VuProfileVista/user/new">
					<i class="fas fa-plus"></i> Create
				</button>
				<button type="submit" class="btn btn-warning"
					formaction="/VuProfileVista/user/update">
					<i class="fas fa-pencil-alt"></i> Update
				</button>
			</div>
		</form>
		<!-- Table -->
		<table class="table mt-4">
			<thead>
				<tr>
					<th>ID</th>
					<th>UserName</th>
					<th>FullName</th>
					<th>Password</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users}">
					<tr>
						<td>${user.userId}</td>
						<td>${user.username}</td>
						<td>${user.fullName}</td>
						<td>${user.password}</td>
						<td>${user.email}</td>
						<td><a class="btn btn-warning btn-sm"
							href="/VuProfileVista/user/edit?name=${user.username}"> <i
								class="fas fa-edit"></i> Edit
						</a> <a class="btn btn-danger btn-sm"
							href="/VuProfileVista/user/delete?id=${user.userId}"> <i
								class="fas fa-trash-alt"></i> Delete
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
