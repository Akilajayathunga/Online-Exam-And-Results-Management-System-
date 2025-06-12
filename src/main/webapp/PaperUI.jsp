<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Module.Examiner" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Take Exam</title>

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Bootstrap (Optional if you prefer Bootstrap buttons or components) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome (for icons if needed) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-gray-900 text-white">

<div class="max-w-4xl mx-auto p-6 mt-10 bg-gray-800 rounded-lg shadow-lg">
    <h2 class="text-3xl font-bold text-center text-green-400 mb-6">
        Exam: <%= request.getAttribute("model") %>
    </h2>

    <form action="ExamUi.jsp" method="post">
        <input type="hidden" name="model" value="<%= request.getAttribute("model") %>">

        <%
            List<Examiner> questions = (List<Examiner>) request.getAttribute("questions");
            int index = 1;
            for (Examiner q : questions) {
        %>
        <div class="mb-6 bg-gray-700 p-4 rounded-lg">
            <p class="font-semibold mb-2"><%= index %>. <%= q.getQuestionText() %></p>
            <div class="space-y-2">
                <label class="block">
                    <input type="radio" name="answer<%= index %>" value="<%= q.getOptionA() %>" class="mr-2">
                    <%= q.getOptionA() %>
                </label>
                <label class="block">
                    <input type="radio" name="answer<%= index %>" value="<%= q.getOptionB() %>" class="mr-2">
                    <%= q.getOptionB() %>
                </label>
                <label class="block">
                    <input type="radio" name="answer<%= index %>" value="<%= q.getOptionC() %>" class="mr-2">
                    <%= q.getOptionC() %>
                </label>
                <label class="block">
                    <input type="radio" name="answer<%= index %>" value="<%= q.getOptionD() %>" class="mr-2">
                    <%= q.getOptionD() %>
                </label>
            </div>
        </div>
        <% index++; } %>

        <div class="text-center">
            <button type="submit"
                class="bg-green-500 hover:bg-green-600 text-white px-6 py-2 rounded font-semibold transition duration-200">
                <a href = "ExamUi.jsp"></a>Submit Answers
            </button>
        </div>
    </form>
</div>

</body>
</html>
