
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login.Login</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
        }

        .login-container {
            margin-top: 50px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }

        h2 {
            color: #333333;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            text-align: left;
            color: #000000;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #7113d7;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #6a11cb;
        }

        .register-link {
            margin-top: 15px;
            font-size: 14px;
            color: #1797ff;
            text-decoration: none;
        }

        .register-link:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
<div class="login-container">
    <h2>Вход в систему</h2>

    <form action="Login" method="post">
        <label for="name">Имя пользователя:</label>
        <input type="text" id="name" name="name">

        <label for="pass">Пароль:</label>
        <input type="password" id="pass" name="pass">

        <input type="submit" value="Войти">
    </form>


    <p>Еще не зарегистрированы? <a href="register.jsp" class="register-link">Зарегистрируйтесь!</a></p>
</div>
</body>
</html>
