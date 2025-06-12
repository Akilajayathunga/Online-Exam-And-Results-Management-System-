<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>About Us - Examination & Result Management</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<!-- Tailwind CSS CDN -->
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-800 text-white">



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


	<div class="relative w-full h-[600px] bg-cover bg-center"
		style="background-image: url('img/Aboutus/Aboutus - Copy.jpg');">
		<div
			class="absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center">
			<h1 class="text-green-400 text-6xl font-bold drop-shadow-lg">ABOUT
				US</h1>
		</div>
	</div>
	<!-- Hero Section -->
	<section class="py-12 bg-green-100 text-gray-900">
		<div class="container mx-auto text-center">
			<h1 class="text-4xl font-bold mb-4 text-green-700">About Our
				Examination & Result Management System</h1>
			<p class="text-lg max-w-3xl mx-auto">A smart solution designed to
				streamline the examination process, simplify student result
				handling, and manage user data efficiently using a lightweight
				file-based backend.</p>
		</div>
	</section>

	<!-- Key Features Section -->
	<section class="container my-12">
		<div class="row g-5">
			<div class="col-md-6">
				<h2 class="text-2xl font-semibold text-green-500 mb-3">Key
					Features</h2>
				<ul class="list-disc list-inside text-white space-y-2">
					<li>User registration and student data management</li>
					<li>Email-based user search and update</li>
					<li>Exam records stored in simple text format</li>
					<li>Result viewing and deletion supported</li>
					<li>Secure password-based access</li>
				</ul>
			</div>
			<div class="col-md-6">
				<h2 class="text-2xl font-semibold text-green-500 mb-3">Why
					Choose This System?</h2>
				<ul class="list-disc list-inside text-white space-y-2">
					<li>Managed by examiners with high professional standards</li>
					<li>Trusted by institutions for reliable result handling</li>
					<li>Fast and efficient service</li>
					<li>UGC Approved</li>

				</ul>
			</div>
		</div>
	</section>

	<!-- Mission Section -->
	<section class="bg-green-50 py-10 text-center text-gray-900">
		<div class="container">
			<h2 class="text-3xl font-bold text-green-700 mb-4">Our Mission</h2>
			<p class="text-lg max-w-3xl mx-auto">We aim to provide
				educational institutions with an easy-to-use system that ensures
				secure, efficient, and reliable examination and result processing —
				without complex infrastructure.</p>

			<!-- Get Started Button -->
			<div class="mt-6">
				<a href="UserReg.jsp"
					class="inline-block px-6 py-3 bg-green-600 text-white font-semibold rounded hover:bg-green-700 transition">Get
					Started</a>
			</div>
		</div>
	</section>



	<!-- Bootstrap JS (Optional) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
