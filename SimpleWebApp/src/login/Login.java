package login;

import model.UserEntity;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "/login.Login", urlPatterns = "/login.Login")
public class Login extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/users";

    private static final String DB_MOBILE_URL = "jdbc:mysql://localhost:3306/mobile_operator";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "admin";

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("Драйвер не найден", e);
        }
    }

    public static ResultSet getAllPhoneNumbers() throws Exception {
        String sql = "SELECT * FROM phone_number";
        Connection connection = DriverManager.getConnection(DB_MOBILE_URL, DB_USER, DB_PASSWORD);
        PreparedStatement statement = connection.prepareStatement(sql);
        return statement.executeQuery();
    }

    public static ResultSet getAllPhonePlans() throws Exception {
        String sql = "SELECT * FROM phone_plan";
        Connection connection = DriverManager.getConnection(DB_MOBILE_URL, DB_USER, DB_PASSWORD);
        PreparedStatement statement = connection.prepareStatement(sql);
        return statement.executeQuery();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("name");
        String pass = request.getParameter("pass");

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

            String sql = "SELECT * FROM user WHERE name = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, username);
                statement.setString(2, pass);

                ResultSet rs = statement.executeQuery();

                    if (rs.next()) {
                        String role = rs.getString("role");

                        if ("admin".equals(role)){
                            response.sendRedirect("admin.jsp");
                        } else if ("user".equals(role)) {
                            response.sendRedirect("user.jsp");
                        }
                    } else {
                        response.sendRedirect("index.jsp");
                    }


        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Ошибка подключения к базе данных", e);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
