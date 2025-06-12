package servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import service.ExamPaymentService;

import java.io.IOException;

@WebServlet("/DeleteExamPayment")
public class DeleteExamPayment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        ExamPaymentService service = new ExamPaymentService();
        boolean deleted = service.deletePayment(email);

        if (deleted) {
            response.sendRedirect("ViewExamPayments"); // refresh list
        } else {
            request.setAttribute("error", "Failed to delete payment.");
            request.getRequestDispatcher("Payment.jsp").forward(request, response);
        }
    }
}
