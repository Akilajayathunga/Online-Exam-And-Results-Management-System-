<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Teacher Dashboard</title>

  <!-- Tailwind & Bootstrap -->
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  <style>
    body {
      background-color: #1F2937; /* Tailwind bg-gray-800 */
    }
    .form-control, .form-select {
      margin-bottom: 1rem;
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
  <!-- Dashboard Container -->
<div class="container mt-5 pt-24 text-white">
    <h1 class="text-3xl font-bold text-center mb-5 text-green-400">Welcome, Examiner</h1>

    <!-- Section 1: Add Questions -->
    <div class="bg-white text-black p-4 rounded shadow mb-5">
      <h2 class="text-2xl font-semibold mb-4">Add New Question</h2>
      <form action="SaveQuestionServlet" method="post" class="row g-3">
        <div class="col-md-6">
          <input type="text" name="model" class="form-control" placeholder="Model Name (e.g., Model 1)" required>
        </div>
        <div class="col-md-12">
          <textarea name="question" class="form-control" placeholder="Enter Question" required></textarea>
        </div>
        <div class="col-md-6">
          <input type="text" name="optionA" class="form-control" placeholder="Option A" required>
        </div>
        <div class="col-md-6">
          <input type="text" name="optionB" class="form-control" placeholder="Option B" required>
        </div>
        <div class="col-md-6">
          <input type="text" name="optionC" class="form-control" placeholder="Option C" required>
        </div>
        <div class="col-md-6">
          <input type="text" name="optionD" class="form-control" placeholder="Option D" required>
        </div>
        <div class="col-md-4">
          <select name="correctAnswer" class="form-select" required>
            <option value="" disabled selected>Select Correct Answer</option>
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
            <option value="D">D</option>
          </select>
        </div>
        <div class="col-md-12">
          <button type="submit" class="btn btn-success">Add Question</button>           
        </div>
        
        
      </form>
      
    </div>

<a href="Home.jsp" class="btn btn-danger">Logout</a>
  </div>

</body>
</html>
