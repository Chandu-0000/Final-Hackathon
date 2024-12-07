package admin;

import java.io.IOException;
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

//@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Setup the connection
        String jdbcUrl = "jdbc:mysql://localhost:3306/handicraft";
        String jdbcUser = "root";
        String jdbcPass = "Chandu_0000";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPass);
            
            // Query to get all users
            String query = "SELECT * FROM users WHERE role IN ('artisan', 'customer', 'cultural_consultant')";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            
            // Set result in request scope to display in JSP
            request.setAttribute("userList", rs);
            request.getRequestDispatcher("/adminDashboard.jsp").forward(request, response);
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
