import java.io.*;
import java.util.*;
import java.sql.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

public class CheckRegister extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String familyName = request.getParameter("familyName");
        String firstName = request.getParameter("firstName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmedPassword = request.getParameter("confirmedPassword");

        String familyNameError = null;
        String firstNameError = null;
        String emailError = null;
        String passwordError = null;
        String confirmedPasswordError = null;

        HttpSession session = request.getSession(true);
        session.setAttribute("familyName", familyName);
        session.setAttribute("firstName", firstName);
        session.setAttribute("email", email);
        session.setAttribute("password", password);

        // バリデーション処理
        boolean isValid = true;

        // familyName バリデーション
        if (familyName == null || familyName.trim().isEmpty()) {
            familyNameError = "姓を入力してください";
            isValid = false;
        } else {
            Pattern pattern = Pattern.compile("^.{1,10}$");
            Matcher matcher = pattern.matcher(familyName);
            if (!matcher.matches()) {
                familyNameError = "漢字、ひらがな、カタカナを入力してください";
                isValid = false;
            }
        }

        // firstName バリデーション
        if (firstName == null || firstName.trim().isEmpty()) {
            firstNameError = "名を入力してください";
            isValid = false;
        } else {
            Pattern pattern = Pattern.compile("^.{1,10}$");
            Matcher matcher = pattern.matcher(firstName);
            if (!matcher.matches()) {
                firstNameError = "漢字、ひらがな、カタカナを入力してください";
                isValid = false;
            }
        }

        // email バリデーション
        if (email == null || email.trim().isEmpty()) {
            emailError = "メールアドレスを入力してください";
            isValid = false;
        } else {
            Pattern pattern = Pattern.compile("^[a-zA-Z0-9-_\\.]+@[a-zA-Z0-9-_\\.]+$");
            Matcher matcher = pattern.matcher(email);
            if (!matcher.matches()) {
                emailError = "有効なメールアドレスを入力してください";
                isValid = false;
            }
        }

        // password バリデーション
        if (password == null || password.trim().isEmpty()) {
            passwordError = "パスワードを入力してください";
            isValid = false;
        } else {
            Pattern pattern = Pattern.compile("^.{8,20}$");
            Matcher matcher = pattern.matcher(password);
            if (!matcher.matches()) {
                passwordError = "8～20字の英数字を入力してください";
                isValid = false;
            }
        }

        // confirmedPassword バリデーション
        if (confirmedPassword == null || confirmedPassword.trim().isEmpty()) {
            confirmedPassword = "確認用パスワードを入力してください";
            isValid = false;
        } else {
            Pattern pattern = Pattern.compile("^.{8,20}$");
            Matcher matcher = pattern.matcher(confirmedPassword);
            if (!matcher.matches()) {
                confirmedPasswordError = "8～20文字の英数字を入力してください";
                isValid = false;
            }
        }

        // confirmedPassword バリデーション
        if (!confirmedPassword.equals(password)) {
            confirmedPasswordError = "パスワードが一致しません";
            isValid = false;
        }

        // エラーメッセージをリクエストにセットしてフォームに戻す
        if (!isValid) {
            request.setAttribute("familyNameError", familyNameError);
            request.setAttribute("firstNameError", firstNameError);
            request.setAttribute("emailError", emailError);
            request.setAttribute("passwordError", passwordError);
            request.setAttribute("confirmedPasswordError", confirmedPasswordError);

            request.setAttribute("familyName", familyName);
            request.setAttribute("firstName", firstName);
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            request.setAttribute("confirmedPassword", confirmedPassword);

            // フォームにエラーメッセージを表示するためにforward
            request.getRequestDispatcher("/register").forward(request, response);
        } else {
            // バリデーションが成功した場合、登録情報を表示するページにリダイレクト
            response.sendRedirect("/tutorial/printRegister");
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
