package servlet;



import Module.ContactMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ContactService;
import service.UserServices;


import java.io.IOException;

@WebServlet("/AddContactMessage")
public class AddContactMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ContactMessage msg = new ContactMessage();
        msg.setName(request.getParameter("name"));
        msg.setEmail(request.getParameter("email"));
        msg.setSubject(request.getParameter("subject"));
        msg.setMessage(request.getParameter("message"));

        ContactService service = new ContactService();
        service.addMessage(msg);

        response.sendRedirect("Contactus.jsp"); // Refresh page
    }
}
