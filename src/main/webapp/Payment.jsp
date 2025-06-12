<%@page import="service.ExamPaymentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ExamPaymentService eap = new ExamPaymentService();
List<Payment> pay = eap.getAllPayments();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
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




	<div
		class="container bg-gray-800 text-white p-6 rounded shadow-lg max-w-7xl mx-auto grid lg:grid-cols-2 gap-10 pt-32">

		<!-- LEFT: Payment Form -->
		<form action="AddExamPayment" method="post">
			<div>
				<h2 class="text-2xl font-bold mb-4">Payment</h2>

				<!-- Contact Info Inputs -->
				<div class="mb-4">
					<label class="form-label">Full Name</label> <input type="text"
						class="form-control" name="name" id="nameInput"
						placeholder="Enter your full name" required>
				</div>

				<div class="mb-4">
					<label class="form-label">Email Address</label> <input type="email"
						class="form-control" name="email" id="emailInput"
						placeholder="Enter your email address" required>
				</div>

				<div class="mb-4">
					<label class="form-label">Mobile Number</label> <input type="tel"
						class="form-control" name="mobile" id="mobileInput"
						placeholder="Enter your mobile number" required>
				</div>


				<!-- Hidden Fields to Send -->
				<input type="hidden" name="exam" id="examField"> <input
					type="hidden" name="price" id="priceField">

				<!-- Exam Dropdown -->
				<div class="mb-4">
					<label class="form-label fw-semibold">Select Exam</label> <select
						id="examDropdown" class="form-select" onchange="updateFields()">
						<option value="Math Exam|40">IT2002 - $40</option>
						<option value="English Exam|35">IT2050 Exam - $35</option>
						<option value="Science Exam|50">Mad Exam - $50</option>
				
					</select>
				</div>


				<!-- Payment Method -->
				<div class="mb-4">
					<label class="font-semibold mb-2 d-block">Pay With:</label>
					<div class="flex gap-4">
						<label class="form-check-label me-3"> <input type="radio"
							name="payMethod" class="form-check-input" checked> <i
							class="fas fa-credit-card text-green-500 me-1"></i> Card
						</label> <label class="form-check-label me-3"> <input type="radio"
							name="payMethod" class="form-check-input"> <i
							class="fas fa-university text-green-500 me-1"></i> Bank Transfer
						</label> <label class="form-check-label"> <input type="radio"
							name="payMethod" class="form-check-input"> <i
							class="fab fa-bitcoin text-green-500 me-1"></i> Crypto
						</label>
					</div>
				</div>

				<!-- Card Details -->
				<div class="mb-3">
					<label class="form-label">Card Number</label> <input type="text"
						name="cardNumber" class="form-control"
						placeholder="5399 0000 0000 0000">
				</div>

				<div class="row mb-3">
					<div class="col">
						<label class="form-label">Expiration Date</label> <input
							type="text" name="expiryDate" class="form-control"
							placeholder="MM/YY">
					</div>
					<div class="col">
						<label class="form-label">CVV</label> <input type="text"
							name="cvv" class="form-control" placeholder="***">
					</div>
				</div>



				<button
					class="bg-green-500 hover:bg-green-600 text-white py-2 px-4 rounded w-100">
					Pay</button>

				<p class="text-xs text-gray-500 mt-2">Your personal data will be
					used to process your order and support your experience throughout
					this site.</p>
			</div>


		</form>
		<%@ page import="java.util.*, Module.Payment"%>

		<div class="container-fluid mt-5 px-4">
			<h2 class="text-2xl font-bold mb-5 text-center text-success">
				All Exam Payments</h2>

			<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
				<%
				if (pay != null && !pay.isEmpty()) {
					for (Payment p : pay) {
				%>
				<div class="col">
					<div
						class="card h-100 w-100 shadow-sm border border-success rounded-lg"
						style="min-width: 280px;">
						<div class="card-body">
							<h5 class="card-title text-primary mb-3">
								<i class="fas fa-user me-2"></i>
								<%=p.getName()%>
							</h5>
							<ul class="list-unstyled">
								<li class="mb-1"><i
									class="fas fa-envelope me-2 text-secondary"></i> <strong>Email:</strong>
									<%=p.getEmail()%></li>
								<li class="mb-1"><i
									class="fas fa-phone me-2 text-secondary"></i> <strong>Mobile:</strong>
									<%=p.getMobile()%></li>
								<li class="mb-1"><i
									class="fas fa-book-open me-2 text-secondary"></i> <strong>Exam:</strong>
									<%=p.getExam()%></li>
								<li class="mb-1"><i
									class="fas fa-dollar-sign me-2 text-secondary"></i> <strong>Price:</strong>
									$<%=p.getPrice()%></li>
								<li class="mb-1"><i
									class="fas fa-credit-card me-2 text-secondary"></i> <strong>Card:</strong>
									<%=p.getCardNumber()%></li>
								<li class="mb-1"><i
									class="fas fa-calendar me-2 text-secondary"></i> <strong>Expiry:</strong>
									<%=p.getExpiryDate()%></li>
								<li class="mb-1"><i class="fas fa-lock me-2 text-secondary"></i>
									<strong>CVV:</strong><%=p.getCvv()%></li>
							</ul>
							<div class="d-flex gap-2">
								<form action="DeleteExamPayment" method="post"
									onsubmit="return confirm('Are you sure you want to delete this record?')">
									<input type="hidden" name="email" value="<%=p.getEmail()%>">
									<button class="btn btn-danger btn-sm">
										<i class="fas fa-trash-alt me-1"></i> Delete
									</button>
								</form>

								<a href="e1,jsp.jsp" class="btn btn-success btn-sm"> <i
									class="fas fa-check me-1"></i> Confirm
								</a>
							</div>
							
						</div>
					</div>
				</div>
				<%
				}
				} else {
				%>
				<div class="col">
					<div class="alert alert-info text-center w-100">No payment
						records found.</div>
				</div>
				<%
				}
				%>
			</div>

		</div>
	</div>


<script>
  // Function to update hidden fields when a new exam is selected
  function updateFields() {
    const dropdown = document.getElementById("examDropdown");
    const selectedValue = dropdown.value;

    // Split the value into exam name and price
    const [exam, price] = selectedValue.split("|");

    // Update the hidden fields with the selected exam and price
    document.getElementById("examField").value = exam;
    document.getElementById("priceField").value = price;
  }

  // Make sure fields are set on page load
  window.onload = function() {
    updateFields();
  };
</script>

</body>
</html>
