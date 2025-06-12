<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ExamPro</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<style>

/* Background Slider Styling */
.hero {
	position: relative;
	height: 100vh;
	overflow: hidden;
}

.hero::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-size: cover;
	background-position: center;
	z-index: -1;
}
</style>


</head>
<body class="font-sans bg-gray-900 text-white m-0 p-0">

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
	<section
		class="hero flex items-center justify-center text-center relative h-screen overflow-hidden pt-20">
		<!-- Background image container -->
		<div id="bg-slider"
			class="absolute top-0 left-0 w-full h-full bg-cover bg-center z-0 transition-all duration-1000"></div>

		<!-- Overlay -->
		<div class="absolute inset-0 bg-black bg-opacity-50 z-10"></div>

		<!-- Arrows -->
		<!-- Arrows -->
		<div
			class="absolute bottom-6 left-1/2 transform -translate-x-1/2 z-20 flex space-x-4">
			<button onclick="prevSlide()"
				class="bg-green-500 bg-opacity-40 hover:bg-opacity-70 text-white p-3 rounded-full text-xl">
				<i class="fas fa-chevron-left"></i>
			</button>
			<button onclick="nextSlide()"
				class="bg-green-500 bg-opacity-40 hover:bg-opacity-70 text-white p-3 rounded-full text-xl">
				<i class="fas fa-chevron-right"></i>
			</button>
		</div>


		<!-- Content -->
		<div class="relative z-20">
			<h1 class="text-5xl font-bold text-green-400">The Most Popular
				Online Exam Site</h1>
			<p class="text-lg mt-4">We Will Open The World Of Knowledge For
				You!</p>
			<div class="mt-6">
				<button class="bg-green-500 text-white px-6 py-3 rounded-lg text-lg">
					<a href="UserReg.jsp">Get Started</a>
				</button>
				<button
					class="bg-white text-gray-900 px-6 py-3 rounded-lg text-lg ml-4">
					<a href="Aboutus.jsp">Learn More</a>
				</button>
			</div>
		</div>
	</section>


	<!-- Info Boxes Section -->
	<section class="bg-white py-10">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			<div class="grid grid-cols-1 md:grid-cols-3 gap-8 text-center">

				<!-- Box 1 -->
				<div class="bg-[#0B0B45] text-white p-6 rounded-lg shadow">
					<h3 class="text-xl font-bold mb-2">Get Support</h3>
					<h4 class="text-green-400 font-semibold mb-2">Support &
						Service</h4>
					<p class="text-sm">Our Support team are at your service. If
						need anything, request or support! We are available for You!</p>
				</div>

				<!-- Box 2 -->
				<div class="bg-[#0B0B45] text-white p-6 rounded-lg shadow">
					<h3 class="text-xl font-bold mb-2">Attend Your Examination</h3>
					<h4 class="text-green-400 font-semibold mb-2">Subject &
						Resources</h4>
					<p class="text-sm">Choose your subject and question bank with
						lots of questions. And get ready to give the exam. The random
						questions will get in your exams.</p>
				</div>

				<!-- Box 3 -->
				<div class="bg-[#0B0B45] text-white p-6 rounded-lg shadow">
					<h3 class="text-xl font-bold mb-2">Join Us</h3>
					<h4 class="text-green-400 font-semibold mb-2">Welcome to the
						ExamHub</h4>
					<p class="text-sm">Join to our ExamHub community. Get the
						latest update and Our support team are always by your side and
						provide you with the best possible support!</p>
				</div>

			</div>
		</div>
	</section>



	<!-- JavaScript for Background Slider -->
	<script>
		const images = [ "url('img/Home/bg1.jpg')", "url('img/Home/bg2.jpg')",
				"url('img/Home/bg4.jpg')" , "url('img/Home/bg3.jpg')"];
		let currentIndex = 0;

		function updateBackground() {
			document.getElementById('bg-slider').style.backgroundImage = images[currentIndex];
		}

		function nextSlide() {
			currentIndex = (currentIndex + 1) % images.length;
			updateBackground();
		}

		function prevSlide() {
			currentIndex = (currentIndex - 1 + images.length) % images.length;
			updateBackground();
		}

		// Initial load
		updateBackground();
	</script>




</body>
</html>
