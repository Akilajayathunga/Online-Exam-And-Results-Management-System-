package servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import Module.Payment;
import service.ExamPaymentService;

@WebServlet("/ViewExamPayments")
public class ViewExamPayments extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	ExamPaymentService service = new ExamPaymentService();
    	List<Payment> payments = service.getAllPayments();
    	request.setAttribute("payments", payments);
    	request.getRequestDispatcher("Payment.jsp").forward(request, response);

    }
}
