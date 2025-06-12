package servlet;


import Module.ContactMessage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ContactService;
import service.UserServices;


import java.io.IOException;
import java.util.List;

@WebServlet("/ContactUs")
public class GetContactMessagesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ContactService service = new ContactService();
        List<ContactMessage> messages = service.getAllMessages();

        request.setAttribute("messages", messages);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ContactUs.jsp");
        dispatcher.forward(request, response);
    }
}
