package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebServlet("/confirm")
public class ConfirmServlet extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(RegisterServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // for Debug
        logger.debug("Recieved username: " + username);
        logger.debug("Recieved email: " + email);

        // セッションに保存（確認画面で使用）
        request.setAttribute("username", username);
        request.setAttribute("email", email);
        HttpSession session = request.getSession();
        session.setAttribute("password", password);
        
        // confirm.jsp に転送
        RequestDispatcher dispatcher = request.getRequestDispatcher("confirm.jsp");
        dispatcher.forward(request, response);
    }
}
