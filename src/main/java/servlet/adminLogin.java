package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.otherservice;

import java.io.IOException;

@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public adminLogin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("imail");
        String password = request.getParameter("ipass");

        otherservice service = new otherservice();
        boolean isValid = service.validateLogin(email, password);

        if (isValid) {
            response.sendRedirect("AdminDashboard.jsp");
        } else {
            // Send back with error parameter for UI to show a message
            response.sendRedirect("AdminLogin.jsp?error=1");
        }
    }
}
