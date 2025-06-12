package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserServices;

import java.io.IOException;

/**
 * Servlet implementation class userDelete
 */
@WebServlet("/userDelete")
public class userDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String email = request.getParameter("email");

	        UserServices service = new UserServices();
	        boolean deleted = service.deleteUser(email);

	        if (deleted) {
	            request.setAttribute("message", "Account deleted successfully.");
	            response.sendRedirect("UserReg.jsp"); // Redirect after deletion
	        } else {
	            request.setAttribute("error", "Unable to delete user.");
	            request.getRequestDispatcher("UserDashboard.jsp").forward(request, response);
	        }
	    }
}
