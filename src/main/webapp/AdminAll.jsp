<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Module.UserReg" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Student Records</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 p-6 text-white min-h-screen">

    <!-- Page Container -->
    <div class="container mx-auto">

        <!-- Title -->
        <h2 class="text-3xl font-bold text-center mb-6 text-orange-400">Student Registration Details</h2>

        <!-- Buttons -->
        <div class="flex justify-center space-x-4 mb-6">
            <a href="AdminDashboard.jsp" class="bg-green-500 hover:bg-green-600 text-white font-semibold py-2 px-4 rounded-lg shadow transition duration-300">
                ← Back to Dashboard
            </a>
            <a href="Home.jsp" class="bg-red-600 hover:bg-red-700 text-white font-semibold py-2 px-4 rounded-lg shadow transition duration-300">
                Logout
            </a>
        </div>

        <!-- Student Table -->
        <div class="overflow-x-auto bg-gray-800 rounded-lg shadow-lg">
            <table class="min-w-full text-sm text-white">
                <thead class="bg-gray-700 text-orange-300">
                    <tr>
                        <th class="px-3 py-2 text-left">Email</th>
                        <th class="px-3 py-2 text-left">Name</th>
                        <th class="px-3 py-2 text-left">Qualification</th>
                        <th class="px-3 py-2 text-left">DOB</th>
                        <th class="px-3 py-2 text-left">Gender</th>
                        <th class="px-3 py-2 text-left">Address</th>
                        <th class="px-3 py-2 text-left">City</th>
                        <th class="px-3 py-2 text-left">PIN</th>
                        <th class="px-3 py-2 text-left">Contact</th>
                        <th class="px-3 py-2 text-left">Password</th>
                        <th class="px-3 py-2 text-center">Action</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-600">
                    <%
                        List<UserReg> users = (List<UserReg>) request.getAttribute("users");
                        if (users != null) {
                            for(UserReg user : users) {
                    %>
                    <tr class="hover:bg-gray-700">
                        <td class="px-3 py-2"><%= user.getEmail() %></td>
                        <td class="px-3 py-2"><%= user.getStudentName() %></td>
                        <td class="px-3 py-2"><%= user.getQualification() %></td>
                        <td class="px-3 py-2"><%= user.getDob() %></td>
                        <td class="px-3 py-2"><%= user.getGender() %></td>
                        <td class="px-3 py-2"><%= user.getAddress() %></td>
                        <td class="px-3 py-2"><%= user.getCity() %></td>
                        <td class="px-3 py-2"><%= user.getPin() %></td>
                        <td class="px-3 py-2"><%= user.getContact() %></td>
                        <td class="px-3 py-2"><%= user.getPassword() %></td>
                        <td class="px-3 py-2 text-center">
                            <form action="UserDeleteAdminSide" method="post" onsubmit="return confirm('Are you sure you want to delete this student?');">
                                <input type="hidden" name="email" value="<%= user.getEmail() %>">
                                <button type="submit" class="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded-md text-xs font-semibold shadow">
                                    🗑 Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="11" class="text-center py-4 text-red-400">No students found.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
