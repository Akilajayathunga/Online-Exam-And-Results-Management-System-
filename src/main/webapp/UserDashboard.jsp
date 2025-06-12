<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Module.UserReg"%>
<%
UserReg user = (UserReg) request.getAttribute("user");

if (user == null) {
%>
<div style="color: red; padding: 2rem;">
	<h2>User data not found ❌</h2>
	<p>
		Please <a href="Userlogin.jsp" style="color: #00ff88;">login again</a>.
	</p>
</div>
<%
return;
}
%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Dashboard - ExamPro</title>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	rel="stylesheet">

</head>
<body class="bg-[#0f172a] text-white">



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

	<!-- Dashboard -->
	<main class="pt-28 px-6 lg:px-16 min-h-screen">
		<h1 class="text-4xl font-bold mb-6 text-green-400">User Dashboard</h1>
		<p class="text-gray-300 mb-10">Here are your registered details:</p>

		<div class="overflow-x-auto bg-gray-800 rounded-lg shadow-lg p-6">
			<table class="table-auto w-full text-left text-white">
				<thead>
					<tr class="border-b border-gray-700">
						<th class="py-3">Field</th>
						<th class="py-3">Value</th>

					</tr>
				</thead>
				<tbody id="details-table" class="divide-y divide-gray-700">

					<!-- Example Row (Repeat This) -->
					<!-- Email -->
					<tr class="hover:bg-gray-700">
						<td class="py-3 font-semibold">Email</td>
						<td class="py-3"><%=user.getEmail()%></td>

						<!-- Edit/Delete buttons remain -->
						</td>
					</tr>

					<!-- Student Name -->
					<tr class="hover:bg-gray-700">
						<td class="py-3 font-semibold">Student Name</td>
						<td class="py-3"><%=user.getStudentName()%></td>

					</tr>

					<!-- Qualification -->
					<tr class="hover:bg-gray-700">
						<td class="py-3 font-semibold">Qualification</td>
						<td class="py-3"><%=user.getQualification()%></td>

					</tr>

					<!-- DOB -->
					<tr class="hover:bg-gray-700">
						<td class="py-3 font-semibold">Date of Birth</td>
						<td class="py-3">
							<%
							java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
							String dob = sdf.format(user.getDob());
							%> <%=dob%>
						</td>

					</tr>

					<!-- Gender -->
					<tr class="hover:bg-gray-700">
						<td class="py-3 font-semibold">Gender</td>
						<td class="py-3"><%=user.getGender()%></td>

					</tr>

					<!-- Address -->
					<tr class="hover:bg-gray-700">
						<td class="py-3 font-semibold">Address</td>
						<td class="py-3"><%=user.getAddress()%></td>
					</tr>

					<!-- City -->
					<tr class="hover:bg-gray-700">
						<td class="py-3 font-semibold">City</td>
						<td class="py-3"><%=user.getCity()%></td>
					</tr>

					<!-- Pin -->
					<tr class="hover:bg-gray-700">
						<td class="py-3 font-semibold">Pin</td>
						<td class="py-3"><%=user.getPin()%></td>
					</tr>

					<!-- Contact -->
					<tr class="hover:bg-gray-700">
						<td class="py-3 font-semibold">Contact</td>
						<td class="py-3"><%=user.getContact()%></td>
					</tr>


				</tbody>
			</table>

			<!-- Delete Account Button -->
			<form action="userDelete" method="post"
				onsubmit="return confirm('Are you sure you want to delete your account?');">
				<input type="hidden" name="email" value="<%=user.getEmail()%>">
				<button type="submit"
					class="bg-red-600 hover:bg-red-700 text-white px-6 py-3 rounded-full text-lg">
					<i class="fas fa-trash-alt mr-2"></i> Delete Your Account
				</button>
			</form>


			<!-- Update Account Button -->
			<div class="mt-10 text-center">
				<!-- Update the link to your update page -->
				<!-- Update Account Button (POST form to UserUpdate servlet) -->
				<form action="UserUpdate.jsp" method="post">
					<!-- Hidden Inputs to Pass User Data -->
					<input type="hidden" name="email" value="<%=user.getEmail()%>">
					<input type="hidden" name="studentName"
						value="<%=user.getStudentName()%>"> <input type="hidden"
						name="qualification" value="<%=user.getQualification()%>">
					<input type="hidden" name="dob"
						value="<%=user.getDob().toString()%>"> <input
						type="hidden" name="address" value="<%=user.getAddress()%>">
					<input type="hidden" name="city" value="<%=user.getCity()%>">
					<input type="hidden" name="pin" value="<%=user.getPin()%>">
					<input type="hidden" name="contact" value="<%=user.getContact()%>">
					<input type="hidden" name="password"
						value="<%=user.getPassword()%>"> <input type="hidden"
						name="confirmPassword" value="<%=user.getConfirmPassword()%>">
					<input type="hidden" name="gender" value="<%=user.getGender()%>">

					<button type="submit"
						class="bg-green-600 hover:bg-green-700 text-white px-6 py-3 rounded-full text-lg">
						<i class="fas fa-edit mr-2"></i> Update Your Account
					</button>
				</form>

			</div>

		</div>


	</main>

	<!-- JavaScript -->
	<script>
		function deleteRow(button) {
			const isConfirmed = confirm("Are you sure you want to delete this row?");
			if (isConfirmed) {
				const row = button.closest('tr');
				row.remove();
			}
		}

		function deleteAccount() {
			const confirmDelete = confirm("⚠️ Are you sure you want to delete your entire account?");
			if (confirmDelete) {
				alert("Your account has been deleted (simulated).");
			}
		}

		function updateAccount() {
			const confirmupdate = confirm("⚠️ Are you sure you want to update your account?");

		}
	</script>

</body>
</html>
