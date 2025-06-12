<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login - ExamPro</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap 5 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<!-- Tailwind CDN -->
<script src="https://cdn.tailwindcss.com"></script>

<style>
body {
	background: url("img/Userlogin/staff.jpg") no-repeat center center/cover;
	min-height: 100vh;
}

.bg-overlay {
	background-color: rgba(0, 0, 30, 0.9);
}

.green-glow {
	box-shadow: 0 0 15px #00ff88;
}
</style>
</head>
<body>

		<!-- Navbar -->
	<header class="bg-gray-900 py-4 fixed w-full top-0 z-50 shadow-md">
		<div class="container mx-auto flex justify-between items-center px-6">
			<!-- Logo -->
			<div class="text-green-400 text-2xl font-bold">
				<i class="fas fa-graduation-cap"></i> ExamPro
			</div>
			<!-- Navigation -->
			<nav class="space-x-6 hidden md:flex">
				<a href="Home.jsp" class="text-white hover:text-green-400">Home</a>
				<a href="ExamUi.jsp" class="text-white hover:text-green-400">Exams</a>
				<a href="Aboutus.jsp" class="text-white hover:text-green-400">About</a>
				<a href="Contactus.jsp" class="text-white hover:text-green-400">Contact</a>
			</nav>
			<!-- Buttons -->
			<div class="space-x-4">
				<button class="bg-green-500 text-white px-4 py-2 rounded">
					<a href="UserReg.jsp">Register</a>
				</button>

				<a href="Userlogin.jsp"
					class="bg-white text-gray-900 px-4 py-2 rounded">Login</a>
			</div>
		</div>
	</header>


	<!-- Login Form -->
	<div class="d-flex justify-center items-center min-h-screen">
		<div
			class="bg-overlay rounded-lg p-5 green-glow text-white w-full max-w-md mt-5 mx-auto">
			<div class="text-center mb-4">

				<h2 class="text-xl font-bold">Login Your Account Now</h2>
		
			</div>

			<form action="stafflogin" method="post">
				<div class="mb-3">
					<label class="form-label text-sm">Staff Email *</label> <input
						type="text" id="username" class="form-control bg-dark text-white"
						name="imail" required>
				</div>
				<div class="mb-4">
					<label class="form-label text-sm">Password *</label> <input
						type="password" id="password" name="ipass"
						class="form-control bg-dark text-white" required>
				</div>


				<button type="submit" class="btn btn-success w-100">Login
					Now</button>
					<br>
				<div class="flex space-x-4">
				
				</div>

			</form>
		</div>
	</div>


</body>
</html>
