package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Module.UserReg;
import service.UserServices;

import java.io.IOException;
import java.sql.Date;



@WebServlet("/UserUpdate")
public class UserUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Step 1: Get all updated values from form
        UserReg user = new UserReg();
        user.setEmail(request.getParameter("email")); // must be hidden input!
        user.setStudentName(request.getParameter("studentName"));
        user.setQualification(request.getParameter("qualification"));
        user.setDob(Date.valueOf(request.getParameter("dob")));
        user.setAddress(request.getParameter("address"));
        user.setCity(request.getParameter("city"));
        user.setPin(request.getParameter("pin"));
        user.setContact(request.getParameter("contact"));
        user.setPassword(request.getParameter("password"));
        user.setConfirmPassword(request.getParameter("confirmPassword"));
        user.setGender(request.getParameter("gender"));

        // Step 2: Call service to update
        UserServices service = new UserServices();
        boolean updated = service.updateUser(user); // assume it returns true/false

        if (updated) {
            // Step 3: Fetch updated info again
            UserReg updatedUser = service.getOne(user);

            if (updatedUser != null) {
                request.setAttribute("user", updatedUser);
                RequestDispatcher dispatcher = request.getRequestDispatcher("UserDashboard.jsp");
                dispatcher.forward(request, response);
            } else {
                // fallback if somehow still not found
                response.getWriter().write("❌ User not found after update. Try logging in again.");
            }

        } else {
            response.getWriter().write("❌ Failed to update user info.");
        }
    }
}
