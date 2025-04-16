<%@ page import="java.sql.ResultSet" %>
<%@ page import="login.Login" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Пользователь</title>
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

        .user-container {
            margin-top: 50px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 700px;
            text-align: center;
        }

        h2 {
            color: #000000;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #cccccc;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #e0e0e0;
        }

    </style>
</head>
<body>
<div class="user-container">
    <h2>Пользователь</h2>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Название тарифного плана</th>
            <th>Цена плана</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {
                ResultSet phonePlans = Login.getAllPhonePlans();
                while (phonePlans.next()) {
        %>
        <tr>
            <td><%= phonePlans.getInt("id_phone_plan") %></td>
            <td><%= phonePlans.getString("name") %></td>
            <td><%= phonePlans.getDouble("price") %></td>
        </tr>
        <%      }
        } catch (Exception e) {
            e.printStackTrace();
        } %>
        </tbody>
    </table>
</div>
</body>
</html>
