<%@page import="service.ContactService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, java.io.*, Module.ContactMessage, service.UserServices"%>
<%
ContactService service = new ContactService();
List<ContactMessage> messages = service.getAllMessages();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
	
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	rel="stylesheet">
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

	<div class="relative w-full h-[600px] bg-cover bg-center"
		style="background-image: url('img/Contactus/Contactus.jpg');">
		<div
			class="absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center">
			<h1 class="text-green-400 py-20 text-6xl font-bold drop-shadow-lg">Contact
				US</h1>
		</div>
	</div>
	

	<!-- Contact Info & Form -->
	<div class="container mx-auto py-12 px-6 lg:flex gap-10">
		<!-- Contact Info -->
		<div class="w-full lg:w-1/2 mb-10">
			<h2 class="text-3xl font-bold mb-4">Get In Touch</h2>
			<p class="text-gray-600 mb-6">Questions, bug reports, complaints,
				and compliments – we’re here for it all.</p>

			<div class="flex items-start mb-4">
				<i class="fas fa-map-marker-alt text-green-500 text-xl me-3"></i>
				<div>
					<h4 class="font-semibold">Address</h4>
					<p>44/A , Pittugala , Malabe</p>
				</div>
			</div>

			<div class="flex items-start mb-4">
				<i class="fas fa-envelope text-green-500 text-xl me-3"></i>
				<div>
					<h4 class="font-semibold">Email Address</h4>
					<p>support@example.com</p>
				</div>
			</div>

			<div class="flex items-start">
				<i class="fas fa-phone text-green-500 text-xl me-3"></i>
				<div>
					<h4 class="font-semibold">Phone Number</h4>
					<p>+568 6695 4646</p>
				</div>
			</div>
		</div>

		<!-- Contact Form -->
		<div class="w-full lg:w-1/2 bg-white shadow-lg rounded-lg p-6">
			<h3 class="text-2xl font-bold mb-6">Drop Us a Line</h3>
			<form action="AddContactMessage" method="post">
				<input type="text" name="name" placeholder="Your Name"
					class="form-control mb-3" required> <input type="email"
					name="email" placeholder="Enter E-Mail Address"
					class="form-control mb-3" required> <input type="text"
					name="subject" placeholder="Write your subject"
					class="form-control mb-3" required>
				<textarea name="message" rows="4" placeholder="Write your message"
					class="form-control mb-3" required></textarea>
				<button type="submit" class="btn btn-success w-100">Send
					Message</button>
			</form>

		</div>
	</div>

	<!-- 📬 Submitted Messages Section -->
	<div class="container mx-auto px-6 pb-16">
		<h2 class="text-2xl font-bold mb-4 text-center">Your Submitted
			Messages</h2>
		<div id="messagesContainer" class="grid md:grid-cols-2 gap-4">
			<%
			if (messages != null && !messages.isEmpty()) {
				for (ContactMessage msg : messages) {
			%>
			<div class="bg-gray-100 p-4 rounded shadow-md text-black">
				<p>
					<strong>Name:</strong>
					<%=msg.getName()%></p>
				<p>
					<strong>Email:</strong>
					<%=msg.getEmail()%></p>
				<p>
					<strong>Subject:</strong>
					<%=msg.getSubject()%></p>
				<p>
					<strong>Message:</strong>
					<%=msg.getMessage()%></p>

				<!-- Delete Form -->
				<form action="DeleteContactMessage" method="post" class="d-inline">
					<input type="hidden" name="email" value="<%=msg.getEmail()%>">
					<button class="btn btn-danger btn-sm mt-2"
						onclick="return confirmDelete()">
						<i class="fas fa-trash-alt me-1"></i> Delete
					</button>
				</form>


			</div>
			<%
			}
			} else {
			%>
			<p class="text-gray-500">No messages submitted yet.</p>
			<%
			}
			%>
		</div>




	</div>

	<!-- JS Logic -->
	<script>
		function confirmDelete() {
			return confirm("⚠️ Are you sure you want to delete this message?");
		}

		
	</script>


</body>
</html>
