package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import Module.Payment;
import service.ExamPaymentService;
import java.io.IOException;

@WebServlet("/AddExamPayment")
public class AddExamPayment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Payment payment = new Payment();
        payment.setName(request.getParameter("name"));
        payment.setEmail(request.getParameter("email"));
        payment.setMobile(request.getParameter("mobile"));
        payment.setExam(request.getParameter("exam"));
        payment.setPrice(request.getParameter("price"));
        payment.setCardNumber(request.getParameter("cardNumber"));
        payment.setExpiryDate(request.getParameter("expiryDate"));
        payment.setCvv(request.getParameter("cvv"));

        ExamPaymentService service = new ExamPaymentService();
        service.savePayment(payment);

        request.setAttribute("message", "Payment saved successfully!");
        response.sendRedirect("Payment.jsp");
    }
}
