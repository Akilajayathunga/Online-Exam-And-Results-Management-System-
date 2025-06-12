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
<title>Exam Management CRUD</title>




<!-- Bootstrap + Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	background-color: #111827; /* Equivalent to Tailwind's bg-gray-900 */
}

.table td, .table th {
	vertical-align: middle;
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

	<!-- Main Panel Section -->
	<div class="text-center text-green-400 py-20 bg-gray-900">
		<h1 class="text-4xl font-bold mb-8">Exam Management Panel</h1>

		<!-- Form to Add Exam -->
		<div class="container" id="examForm">
			<h2 class="text-2xl font-semibold mb-4">Create New Exam</h2>
			<form action="AdminExamServlet" method="post"
				class="row g-3 bg-white text-black p-4 rounded shadow">


				<div class="col-md-6">
					<input type="text" class="form-control" placeholder="Exam Name"
						name="name" required>
				</div>
				<div class="col-md-6">
					<input type="text" class="form-control" placeholder="Subject"
						name="subject" required>
				</div>
				<div class="col-md-12">
					<textarea class="form-control" placeholder="Description"
						name="description" required></textarea>
				</div>
				<div class="col-md-6">
					<input type="datetime-local" class="form-control" name="datetime"
						required>
				</div>
				<div class="col-md-3">
					<input type="number" class="form-control"
						placeholder="Duration (mins)" name="duration" required>
				</div>
				<div class="col-md-3">
					<input type="number" class="form-control" placeholder="Total Marks"
						name="marks" required>
				</div>
				<div class="col-md-4">
					<select class="form-select" name="status" required>
						<option value="Active">Active</option>
						<option value="Closed">Closed</option>
					</select>
				</div>
				<div class="col-md-12">
					<button type="submit" class="btn btn-warning">Add Exam</button>
				</div>
			</form>
		</div>


		<div class="flex justify-center space-x-4 mt-4">
			<!-- View All Students Button -->
			<a href="ViewAllStudentsServlet"
				class="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded-lg shadow transition duration-300">
				View All Students </a>

			<!-- Logout Button -->
			<a href="Home.jsp"
				class="bg-red-600 hover:bg-red-700 text-white font-semibold py-2 px-4 rounded-lg shadow transition duration-300">
				Logout </a>
		</div>




		<!-- Table to Show Exams -->
		<%@ page import="java.util.*, Module.AdminDashboard"%>

		<div class="container mt-5" id="examTable">
			<h2 class="text-2xl font-semibold mb-3 text-center text-warning">Exam
				List</h2>

			<table
				class="table table-bordered table-striped bg-white shadow text-black">
				<thead class="table-dark">
					<tr>
						<th>#</th>
						<th>Exam Name</th>
						<th>Description</th>
						<th>Subject</th>
						<th>Date & Time</th>
						<th>Duration</th>
						<th>Marks</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (addlist != null && !addlist.isEmpty()) {
						int count = 1;
						for (AdminDashboard exam : addlist) {
					%>
					<tr>
						<td><%=count++%></td>
						<td><%=exam.getName()%></td>
						<td><%=exam.getDescription()%></td>
						<td><%=exam.getSubject()%></td>
						<td><%=exam.getDateTime()%></td>
						<td><%=exam.getDuration()%> mins</td>
						<td><%=exam.getMarks()%></td>
						<td><%=exam.getStatus()%></td>
						<td>
							<form action="DeleteExamDetails" method="post"
								onsubmit="return confirm('Are you sure you want to delete this exam?');">
								<input type="hidden" name="ename" value="<%=exam.getName()%>">
								<button class="btn btn-sm btn-danger">
									<i class="fas fa-trash"></i> Delete
								</button>
							</form>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="9" class="text-center">No exam records found.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>

	</div>

</body>
</html>
