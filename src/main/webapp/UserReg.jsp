<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register | ExamPro</title>

<!-- Tailwind CSS CDN -->
<script src="https://cdn.tailwindcss.com"></script>
<!-- Bootstrap CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
	
<!-- FontAwesome for Icons -->
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>
</head>
<body class="bg-gray-900 text-white">

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
	<!-- Registration Form -->
	<main class="pt-28 pb-12 px-4">
		<div
			class="bg-gray-800 text-white rounded-lg shadow-lg p-8 w-full max-w-3xl mx-auto border-t-4 border-green-400">
			<h2 class="text-2xl font-semibold text-center mb-2">Register
				Your Account Now</h2>
			<p class="text-center text-sm text-green-400 mb-6">
				Already Have An Account? <a href="Userlogin.jsp"
					class="text-green-300 underline">Login Now</a>
			</p>

			<form action="UserRegSetv" method = "post">
				<div class="row g-3">
					<div class="col-md-6">
						<label for="email" class="form-label">Email Id</label> <input
							type="email" class="form-control" name="email"
							placeholder="Enter your email">
					</div>
					<div class="col-md-6">
						<label for="studentName" class="form-label">Student Name</label> <input
							type="text" class="form-control" name="studentName"
							placeholder="Full name">
					</div>
					<div class="col-md-6">
						<label for="qualification" class="form-label">Qualification</label>
						<input type="text" class="form-control" name="qualification"
							placeholder="E.g. BCA">
					</div>
					<div class="col-md-6">
						<label for="dob" class="form-label">Date Of Birth</label> <input
							type="date" class="form-control" name="dob" required>
					</div>
					<div class="col-md-12">
						<label for="address" class="form-label">Address</label>
						<textarea class="form-control" name="address" rows="2"
							placeholder="Enter full address"></textarea>
					</div>
					<div class="col-md-6">
						<label for="state" class="form-label">State</label> <select
							name="state" class="form-select">
							<option selected>Western</option>
							<option>South</option>
							<option>Middle</option>
							<option>Jaffna</option>
						</select>
					</div>
					<div class="col-md-6">
						<label for="city" class="form-label">City</label> <select
							name="city" class="form-select">
							<option selected>Malabe</option>
							<option>Matara</option>
							<option>Kurungala</option>
							<option>Jaffna</option>
						</select>
					</div>
					<div class="col-md-6">
						<label for="pin" class="form-label">Pin</label> <input type="text"
							class="form-control" name="pin" placeholder="6-digit code">
					</div>
					<div class="col-md-6">
						<label for="contact" class="form-label">Contact</label> <input
							type="tel" class="form-control" name="contact"
							placeholder="Phone number">
					</div>
					<div class="col-md-6">
						<label for="password" class="form-label">Password</label> <input
							type="password" class="form-control" name="password"
							placeholder="Password">
					</div>
					<div class="col-md-6">
						<label for="confirmPassword" class="form-label">Confirm
							Password</label> <input type="password" class="form-control"
							name="confirmPassword" placeholder="Confirm password">
					</div>
					<div class="col-md-6">
						<label class="form-label block mb-1">Gender</label>
						<div class="form-check form-check-inline text-white">
							<input class="form-check-input" type="radio" name="gender"
								id="male" value="Male"> <label class="form-check-label"
								for="male">Male</label>
						</div>
						<div class="form-check form-check-inline text-white">
							<input class="form-check-input" type="radio" name="gender"
								id="female" value="Female"> <label
								class="form-check-label" for="female">Female</label>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="terms">
							<label class="form-check-label text-sm" for="terms" required> I have read & agreed with the 
							<a href="#"class="text-green-400 underline">Terms and Conditions</a>
							                               & 
								<a href="#" class="text-green-400 underline">Privacy Policy</a>.
							</label>
						</div>
					</div>
					<div class="col-12 text-center mt-4">
						<button type="submit"
							class="bg-green-500 hover:bg-green-600 px-6 py-2 rounded text-white text-lg">Register
							Now</button>
					</div>
				</div>
			</form>
		</div>
	</main>

</body>
</html>
