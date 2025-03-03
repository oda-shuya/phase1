import java.io.*;
import java.util.*;
import java.sql.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

public class DataRegister extends HttpServlet {
    // データベース接続情報を格納する静的変数
    private static String JDBC_URL;
    private static String JDBC_USER;
    private static String JDBC_PASSWORD;

    // 静的初期化ブロック：クラスがロードされる際に設定を読み込む
    static {
        try {
            loadDatabaseConfig();
        } catch (IOException e) {
            throw new ExceptionInInitializerError("データベース設定の読み込みに失敗しました: " + e.getMessage());
        }
    }

    // データベース設定を読み込むメソッド
    private static void loadDatabaseConfig() throws IOException {
        Properties prop = new Properties();

        try (InputStream inputStream = DataRegister.class.getClassLoader().getResourceAsStream("config.properties")) {
            if (inputStream == null) {
                throw new IllegalStateException("config.propertiesが見つかりません");
            }
            prop.load(inputStream);
            JDBC_URL = prop.getProperty("db.url");
            JDBC_USER = prop.getProperty("db.username");
            JDBC_PASSWORD = prop.getProperty("db.password");
        } catch (IOException e) {
            throw new IOException("設定ファイルの読み込みに失敗しました", e);
        }
    }

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
