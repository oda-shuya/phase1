import java.io.*;
import java.util.*;
import java.sql.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

public class DataRegister extends HttpServlet {
    // データベース接続情報
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/mydatabase";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "Dora1080";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);
        String familyName = (String) session.getAttribute("familyName");
        String firstName = (String) session.getAttribute("firstName");
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("password");

        String sql = "INSERT INTO users (familyName, firstName, email, password) VALUES (?, ?, ?, ?)";

        try {
            // JDBCドライバをロード
            Class.forName("com.mysql.cj.jdbc.Driver");

            // データベース接続
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                // SQL実行
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, familyName);
                    stmt.setString(2, firstName);
                    stmt.setString(3, email);
                    stmt.setString(4, password);

                    // INSERT文の実行（executeUpdateを使用）
                    int rowsAffected = stmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException e) {
            System.out.println("ClassNotFoundException");
        } catch (SQLException e) {
            System.out.println("SQLException");
            e.printStackTrace(); // 詳細なエラー情報を出力
        }
        response.sendRedirect("/tutorial/doneRegister");
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
