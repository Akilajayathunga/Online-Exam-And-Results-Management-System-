package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserServices;

import java.io.IOException;
import java.util.List;

import Module.UserReg;


@WebServlet("/ViewAllStudentsServlet")
public class ViewAllStudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ViewAllStudentsServlet() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	UserServices ser = new UserServices();
    	List<UserReg> users = ser.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("AdminAll.jsp").forward(request, response);
    }

}
