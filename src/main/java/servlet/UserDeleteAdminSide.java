package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserServices;

import java.io.IOException;

/**
 * Servlet implementation class UserDeleteAdminSide
 */
@WebServlet("/UserDeleteAdminSide")
public class UserDeleteAdminSide extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        UserServices service = new UserServices();
        boolean deleted = service.deleteUser1(email);

        if (deleted) {
        	if (deleted) {
        	    request.setAttribute("message", "Account deleted successfully.");
        	    request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response); // Use forward here
        	}

        } else {
            request.setAttribute("error", "Unable to delete user.");
            request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response);
        }
    }
}
