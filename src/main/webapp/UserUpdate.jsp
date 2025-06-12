<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Your Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-white flex justify-center items-center min-h-screen">



    <form action="UserUpdate" method="post" class="bg-gray-800 p-8 rounded-lg shadow-lg space-y-4 w-full max-w-xl">
        <h2 class="text-2xl font-bold text-green-400 text-center">Update Profile</h2>

        <!-- Email (Hidden for submission, visible but disabled) -->
        <input type="hidden" name="email" value="${param.email}" />
        <div>
            <label class="block mb-1 font-semibold">Email (Not Editable)</label>
            <input type="email" value="${param.email}" class="w-full p-2 rounded bg-gray-700" disabled />
        </div>

        <div>
            <label class="block">Name</label>
            <input name="studentName" value="${param.studentName}" required class="w-full p-2 rounded bg-gray-700" />
        </div>

        <div>
            <label class="block">Qualification</label>
            <input name="qualification" value="${param.qualification}" required class="w-full p-2 rounded bg-gray-700" />
        </div>

        <div>
            <label class="block">DOB</label>
            <input type="date" name="dob" value="${param.dob}" required class="w-full p-2 rounded bg-gray-700" />
        </div>

        <div>
            <label class="block">Address</label>
            <input name="address" value="${param.address}" required class="w-full p-2 rounded bg-gray-700" />
        </div>

        <div>
            <label class="block">City</label>
            <input name="city" value="${param.city}" required class="w-full p-2 rounded bg-gray-700" />
        </div>

        <div>
            <label class="block">Pin</label>
            <input name="pin" value="${param.pin}" required class="w-full p-2 rounded bg-gray-700" />
        </div>

        <div>
            <label class="block">Contact</label>
            <input name="contact" value="${param.contact}" required class="w-full p-2 rounded bg-gray-700" />
        </div>

        <div>
            <label class="block">Password</label>
            <input type="password" name="password" value="${param.password}" required class="w-full p-2 rounded bg-gray-700" />
        </div>

        <div>
            <label class="block">Confirm Password</label>
            <input type="password" name="confirmPassword" value="${param.confirmPassword}" required class="w-full p-2 rounded bg-gray-700" />
        </div>

        <div>
            <label class="block">Gender</label>
            <select name="gender" class="w-full p-2 rounded bg-gray-700" required>
                <option value="Male" ${param.gender == 'Male' ? 'selected' : ''}>Male</option>
                <option value="Female" ${param.gender == 'Female' ? 'selected' : ''}>Female</option>
                <option value="Other" ${param.gender == 'Other' ? 'selected' : ''}>Other</option>
            </select>
        </div>

        <div class="text-center pt-4">
            <input type="submit" value="Update Profile" class="bg-green-500 px-6 py-2 rounded hover:bg-green-600" />
        </div>
    </form>
</body>
</html>
