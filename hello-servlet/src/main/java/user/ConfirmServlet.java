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

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String familyname = request.getParameter("familyname");
        String firstname = request.getParameter("firstname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        session.setAttribute("familyname", familyname);
        session.setAttribute("firstname", firstname);
        session.setAttribute("email", email);

        // for Debug
        logger.debug(String.format("Recieved familyname: %s, firstname: %s, email: %s", familyname, firstname, email));
        
        // 保存（確認画面で使用）
        request.setAttribute("familyname", familyname);
        request.setAttribute("firstname", firstname);
        request.setAttribute("email", email);
        request.setAttribute("password", password);
        
        // confirm.jsp に転送
        RequestDispatcher dispatcher = request.getRequestDispatcher("confirm.jsp");
        dispatcher.forward(request, response);
    }
}
    