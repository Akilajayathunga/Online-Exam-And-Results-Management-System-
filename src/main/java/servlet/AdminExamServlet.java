package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import Module.AdminDashboard;
import service.AdminService;
import java.io.IOException;

@WebServlet("/AdminExamServlet")
public class AdminExamServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AdminDashboard ad = new AdminDashboard();
		ad.setName(request.getParameter("name"));
		ad.setSubject(request.getParameter("subject"));
		ad.setDescription(request.getParameter("description"));
		ad.setDateTime(request.getParameter("datetime"));
		ad.setDuration(Integer.parseInt(request.getParameter("duration")));
		ad.setMarks(Integer.parseInt(request.getParameter("marks")));
		ad.setStatus(request.getParameter("status"));

		AdminService service = new AdminService();
		service.addExam(ad);

        response.sendRedirect("AdminDashboard.jsp");

	}
}
