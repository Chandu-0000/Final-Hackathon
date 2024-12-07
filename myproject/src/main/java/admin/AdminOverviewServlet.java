package admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/AdminOverviewServlet")
public class AdminOverviewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jdbcUrl = "jdbc:mysql://localhost:3306/handicraft";
        String jdbcUser = "root";
        String jdbcPass = "Chandu_0000";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPass);
            
            // SQL query to get the count of artisans, customers, and cultural consultants
            String query = "SELECT "
                    + "(SELECT COUNT(*) FROM users WHERE role = 'artisan') AS artisans, "
                    + "(SELECT COUNT(*) FROM users WHERE role = 'customer') AS customers, "
                    + "(SELECT COUNT(*) FROM users WHERE role = 'culturalConsultant') AS consultants";
            
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                // Retrieve the counts
                int artisans = rs.getInt("artisans");
                int customers = rs.getInt("customers");
                int consultants = rs.getInt("consultants");
                
                // Set the counts as a JSON response
                response.setContentType("application/json");
                response.getWriter().write("{\"artisans\": " + artisans + ", \"customers\": " + customers + ", \"consultants\": " + consultants + "}");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving counts");
        }
    }
}
