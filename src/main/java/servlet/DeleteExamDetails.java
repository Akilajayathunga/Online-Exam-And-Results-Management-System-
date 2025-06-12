package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.AdminService;

import java.io.IOException;

@WebServlet("/DeleteExamDetails")
public class DeleteExamDetails extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;

    public DeleteExamDetails() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("ename");

		AdminService service = new AdminService();
		boolean deleted = service.deleteExam(name);

		if (deleted) {
			request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response);

            
		} else {
			request.setAttribute("error", "Failed to delete payment.");
			
		}

	}

}
