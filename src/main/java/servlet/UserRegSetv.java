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

@WebServlet("/UserRegSetv")
public class UserRegSetv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserRegSetv() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserReg reg = new UserReg();
		reg.setEmail(request.getParameter("email"));
		reg.setStudentName(request.getParameter("studentName"));
		reg.setQualification(request.getParameter("qualification"));

		String dobStr = request.getParameter("dob");
		java.sql.Date dob = null;
		if (dobStr != null && !dobStr.trim().isEmpty()) {
			try {
				dob = java.sql.Date.valueOf(dobStr);
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			}
		}
		reg.setDob(dob);

		reg.setAddress(request.getParameter("address"));
		reg.setCity(request.getParameter("city"));
		reg.setPin(request.getParameter("pin"));
		reg.setContact(request.getParameter("contact"));
		reg.setPassword(request.getParameter("password"));
		reg.setConfirmPassword(request.getParameter("confirmPassword"));
		reg.setGender(request.getParameter("gender"));

		UserServices serv = new UserServices();
		serv.RegUser(reg);

		RequestDispatcher dispa = request.getRequestDispatcher("Home.jsp");

		dispa.forward(request, response);
	}

}
