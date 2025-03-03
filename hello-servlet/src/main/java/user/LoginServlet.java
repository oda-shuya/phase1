package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(LoginServlet.class); // 修正

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String loginfamilyname = request.getParameter("loginfamilyname");
        String loginfirstname = request.getParameter("loginfirstname");
        String loginpassword = request.getParameter("loginpassword");

        boolean isActive = false;
        
        try {   
            isActive = isPasswordValid(loginfamilyname, loginfirstname, loginpassword);
        } catch (Exception e){
            logger.error("Exception occurred while checking login: ", e);
        }

        response.sendRedirect("main.jsp?isActive=" + isActive); // 修正
    }

    private boolean isPasswordValid(String loginfamilyname, String loginfirstname, String loginpassword) {
        String url = getServletContext().getInitParameter("db.url");
        String user = getServletContext().getInitParameter("db.user");
        String pass = getServletContext().getInitParameter("db.password");

        String query  = "SELECT password FROM userlist WHERE familyname = ? AND firstname = ? ";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
        PreparedStatement stmt = conn.prepareStatement(query)) {

            logger.debug("Got familyname: {}, firstname: {}", loginfamilyname, loginfirstname);

            stmt.setString(1, loginfamilyname);
            stmt.setString(2, loginfirstname);

            try (ResultSet result = stmt.executeQuery()) {
                if (result.next()) {
                    String correctpassword = result.getString("password");

                    logger.debug("this is a loginpassword: {}, correctpassword: {}", loginpassword, correctpassword);

                    // 入力されたパスワードをハッシュ化
                    if (BCrypt.checkpw(loginpassword, correctpassword)) {
                        logger.debug("If this message is displayed, you may encounter.");
                        return true;
                    } else {
                        logger.debug(String.valueOf(BCrypt.checkpw(loginpassword, correctpassword)));
                        logger.error("UserAction: Incorrect password entered");
                        logger.error("Correct password (hashed): {}", correctpassword);
                    }
                }
            }
        } catch (SQLException e) {
            logger.error("Database error while checking password: ", e); // 修正
        }
        return false; // ここだけでOK
    }
}
