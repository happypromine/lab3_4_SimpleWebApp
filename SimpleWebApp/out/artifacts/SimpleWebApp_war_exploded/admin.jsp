<%@ page import="java.sql.ResultSet" %>
<%@ page import="login.Login" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Админ</title>
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

        .admin-container {
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
<div class="admin-container">
    <h2>Админ</h2>

    <!-- Таблица телефонных номеров -->
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Номер телефона</th>
            <th>Имя владельца</th>
            <th>Фамилия владельца</th>
            <th>ID тарифного плана</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {
                ResultSet phoneNumbers = Login.getAllPhoneNumbers();
                while (phoneNumbers.next()) {
        %>
        <tr>
            <td><%= phoneNumbers.getInt("id_phone_number") %></td>
            <td><%= phoneNumbers.getString("number") %></td>
            <td><%= phoneNumbers.getString("owner_firstname") %></td>
            <td><%= phoneNumbers.getString("owner_lastname") %></td>
            <td><%= phoneNumbers.getInt("id_phone_plan") %></td>
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
