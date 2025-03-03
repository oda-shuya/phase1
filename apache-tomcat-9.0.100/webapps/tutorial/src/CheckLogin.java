import java.io.IOException;
import java.io.PrintWriter;
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

public class CheckLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // データベース接続情報
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/mydatabase";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "Dora1080";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // JDBCドライバをロード
            Class.forName("com.mysql.cj.jdbc.Driver");

            // データベース接続
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                // SQL実行（例：usersテーブルのデータを取得）
                String sql = "SELECT * FROM users";
                try (PreparedStatement stmt = conn.prepareStatement(sql);
                     ResultSet rs = stmt.executeQuery()) {

                    out.println("<table border='1'><tr><th>First Name</th><th>Family Name</th><th>Email</th></tr>");

                    while (rs.next()) {
                        String firstName = rs.getString("firstName");
                        String familyName = rs.getString("familyName");
                        String email = rs.getString("email");

                        out.println("<tr><td>" + firstName + "</td><td>" + familyName + "</td><td>" + email + "</td></tr>");
                    }

                    out.println("</table>");
                }
            }
        } catch (ClassNotFoundException e) {
            out.println("<p>JDBCドライバが見つかりません: " + e.getMessage() + "</p>");
        } catch (SQLException e) {
            out.println("<p>データベース接続エラー: " + e.getMessage() + "</p>");
        }
    }
}
