package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.otherservice;

import java.io.IOException;

@WebServlet("/stafflogin")
public class stafflogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public stafflogin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("imail");
        String password = request.getParameter("ipass");

        otherservice service = new otherservice();
        boolean isValid = service.validateLogin1(email, password);

        if (isValid) {
            response.sendRedirect("ExaminerDashBoard.jsp");
        } else {
            // Send back with error parameter for UI to show a message
            response.sendRedirect("Stafflogin.jsp?error=1");
        }
    }
}
