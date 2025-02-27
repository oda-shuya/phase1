package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import share.generateUuid;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(RegisterServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // パスワードのハッシュ化
        String hashedPassword = PasswordUtil.hashPassword(password);

        boolean success = false;
        try {
            success = saveToDatabase(username, email, hashedPassword);
        } catch (Exception e) {
            logger.error("Exception occurred while saving to database:", e);
        }

        // DB登録の結果を `register.jsp` に送る
        response.sendRedirect("register.jsp?success=" + success);
    }

    private boolean saveToDatabase(String username, String email, String hashedPassword) {
        
        String url = getServletContext().getInitParameter("db.url");
        String user = getServletContext().getInitParameter("db.user");
        String pass = getServletContext().getInitParameter("db.password");
        String uuid = generateUuid.generate();

        if (url == null || user == null || pass == null) {
            logger.error("[ERROR]: Database connection parameters are missing in web.xml.");
            return false;
        }

        // SQLクエリ
        String query = "INSERT INTO userlist (user_uid, username, email, password) VALUES (?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement stmt = conn.prepareStatement(query)) {

            logger.info("Database connection successful!");
            logger.debug("Start inserting: uuid = {}, username={}, email={}", uuid, username, email);

            // パラメータをセット（パスワードはハッシュ化済み）
            stmt.setString(1, uuid);
            stmt.setString(2, username);
            stmt.setString(3, email);
            stmt.setString(4, hashedPassword);

            // SQL 実行
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                logger.info("User inserted successfully!");
                return true;
            } else {
                logger.error("Failed to insert user");
                return false;
            }

        } catch (SQLException e) {
            logger.error("Database query failed: ", e);
            return false;
        }
    }
}
