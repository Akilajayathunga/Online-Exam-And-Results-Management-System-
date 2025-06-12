package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.QuestionService;

import java.io.IOException;
import java.util.List;

import Module.Examiner;

@WebServlet("/LoadExam")
public class LoadExamServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String model = request.getParameter("model");

        QuestionService service = new QuestionService();
        List<Examiner> questions = service.loadQuestionsByModel(model);

        request.setAttribute("model", model);
        request.setAttribute("questions", questions);
        request.getRequestDispatcher("PaperUI.jsp").forward(request, response);
    }
}


