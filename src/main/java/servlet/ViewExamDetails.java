package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.AdminService;
import service.ExamPaymentService;

import java.io.IOException;
import java.util.List;

import Module.AdminDashboard;
import Module.Payment;


@WebServlet("/ViewExamDetails")
public class ViewExamDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewExamDetails() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		AdminService service = new AdminService();
    	List<AdminDashboard> add = service.getAllExams();
    	request.setAttribute("addlist", add);
    	request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response);

		
	}

}
