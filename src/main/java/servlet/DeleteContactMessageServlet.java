package servlet;



import service.ContactService;
import service.UserServices;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteContactMessage")
public class DeleteContactMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        ContactService service = new ContactService();
        service.deleteMessage(email);

        response.sendRedirect("Contactus.jsp");
    }
}
