<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RegisterScreen</title>
    <script>
        function validateForm() {
            var form = document.forms["registerForm"];
            var username = document.forms["registerForm"]["username"].value;
            var email = document.forms["registerForm"]["email"].value;
            var password = document.forms["registerForm"]["password"].value;
            var passwordforcheck = document.forms["registerForm"]["passwordforcheck"].value;

            if (username == "" || email == "" || password == "" || passwordforcheck == "") {
                alert("allitem must be filled out");
                return false;
            }

            if (password != passwordforcheck) {
                alert("password and password(checking) must be the same");
                return false;
            }

            document.getElementById("hiddenUsername").value = username;
            document.getElementById("hiddenEmail").value = email;
            document.getElementById("hiddenPassword").value = password;

            form.submit();
        }
    </script>
</head>
<body>
    <h1>Register Screen </h1>

    <form name="registerForm" action="confirm.jsp" method="post" onsubmit="return validateForm()">
        <p>username
        <input type="text" name="username" placeholder="username"><br />
        </p>

        <p>email
        <input type="email" name="email" placeholder="hello@example.com"><br />
        </p>

        <p>password
        <input type="password" name="password" placeholder="password"><br />
        </p>

        <p>password(checking)
        <input type="password" name="passwordforcheck" placeholder="password(checking)"><br />
        </p>

        <input type="hidden" name="hiddenUsername" id="hiddenUsername">
        <input type="hidden" name="hiddenEmail" id="hiddenEmail">
        <input type="hidden" name="hiddenPassword" id="hiddenPassword">

        <button type="button" onclick="validateForm()">Next</button>
    </form>
</body>
</html>