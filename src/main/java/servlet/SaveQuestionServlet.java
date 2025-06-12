package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import Module.Examiner;
import service.QuestionService;

@WebServlet("/SaveQuestionServlet")
public class SaveQuestionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Read form parameters
        String model = request.getParameter("model");
        String questionText = request.getParameter("question");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String correctAnswer = request.getParameter("correctAnswer");

        // Create Examiner object (used here as the question object)
        Examiner question = new Examiner(model, questionText, optionA, optionB, optionC, optionD, correctAnswer);

        // Save the question
        QuestionService service = new QuestionService();
        service.saveQuestion(question);

        // Redirect to the dashboard or a success page
        response.sendRedirect("ExaminerDashBoard.jsp");
    }
}
