package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserServices;

import java.io.IOException;

import Module.UserReg;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserLogin() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserReg us = new UserReg();
		us.setEmail(request.getParameter("imail"));
		us.setPassword(request.getParameter("ipass"));

		UserServices serv = new UserServices();
		boolean status = serv.Validate(us);

		if (status) {
            
			UserReg fulluser = serv.getOne(us); //get full user informatio
	
			request.setAttribute("user", fulluser); // pass data to UserDashboard.jsp
			
			RequestDispatcher dis = request.getRequestDispatcher("UserDashboard.jsp");
			dis.forward(request, response);
			
			
		} else {

			request.setAttribute("error", "Invalid email or password!");
			RequestDispatcher dis = request.getRequestDispatcher("Userlogin.jsp");
			dis.forward(request, response);

		}

	
	}

}
