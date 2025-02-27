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
    private static final Logger logger = LoggerFactory.getLogger(RegisterServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("email");
        String inputpassword = request.getParameter("password");
        // String hashedinputpassword = PasswordUtil.hashPassword(inputpassword);   
        
        boolean isActive = false;
        try {
            isActive = isPasswordValid(email, inputpassword);
        } catch (Exception e){
            logger.error("Exception occureed while saving to database: ", e);
        }

        response.sendRedirect("main.jsp?isActive=" + isActive);
    }

    private boolean isPasswordValid(String email, String inputpassword) {

        String url = getServletContext().getInitParameter("db.url");
        String user = getServletContext().getInitParameter("db.user");
        String pass = getServletContext().getInitParameter("db.password");

        String query  = "SELECT password FROM userlist WHERE email=?";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement stmt = conn.prepareStatement(query)) {

                logger.debug("got email:{}", email);

                stmt.setString(1, email);

                try (ResultSet result=stmt.executeQuery()){
                    if(result.next()) {
                        String correctpassword = result.getString("password");

                        if ( BCrypt.checkpw(inputpassword, correctpassword)) {
                            return true;
                        }else{
                            logger.error("UserAction: input incorrect password");
                            return false;
                        }
                    }
                }
        } catch (SQLException e){
            return false;
        }
        return false;
    }
}
