<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Module.AdminDashboard"%>
<%@ page import="service.AdminService"%>

<%
AdminService as = new AdminService();
List<AdminDashboard> addlist = as.getAllExams();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>All Courses</title>
<script src="script.js" defer></script>

<!-- Tailwind CDN -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Optional: Bootstrap CDN (used sparingly) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<body class="text-white bg-gray-800">

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


	
	
	<div
		class="container bg-gray-800 text-white p-6 rounded shadow-lg max-w-7xl mx-auto grid lg:grid-cols-2 gap-10 pt-32">

		<%
		List<AdminDashboard> addlist1 = (List<AdminDashboard>) request.getAttribute("addlist");
		if (addlist != null) {
			int count = 1;
			for (AdminDashboard ad : addlist) {
		%>
		<div class="bg-[#050129] text-white rounded-lg shadow-lg p-5">
			<h2 class="text-lg font-bold mb-2"><%=count%>.
				<%=ad.getSubject()%></h2>
			<p class="text-sm mb-1"><%=ad.getDescription()%></p>
			<p class="text-xs text-gray-400 mb-2">
				Date:
				<%=ad.getDateTime()%></p>
			<p class="text-xs text-gray-400 mb-2">
				Duration:
				<%=ad.getDuration()%>
				min | Marks:
				<%=ad.getMarks()%></p>
			<p class="text-xs mb-3">
				<strong>Status:</strong>
				<%=ad.getStatus()%></p>
		<a href="LoadExam?model=<%= ad.getSubject() %>" class="text-green-400 text-sm hover:underline">Attend Quiz &raquo;</a>

		</div>
		<%
		count++;
		}
		} else {
		%>
		<p class="col-span-3 text-center text-gray-600">No exam data
			available.</p>
		<%
		}
		%>
	</div>
	<!-- Cards will be inserted here dynamically -->
	</div>
</body>
</html>
