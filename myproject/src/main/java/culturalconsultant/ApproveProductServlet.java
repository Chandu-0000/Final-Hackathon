package culturalconsultant;
import javax.servlet.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/approveProduct")
public class ApproveProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId")); // Get product ID from form input
        
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft", "root", "Chandu_0000");
            
            // SQL query to update the 'is_approved' column to 1 for the given product
            String query = "UPDATE products SET is_approved = 1 WHERE id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, productId);  // Set the product ID parameter
            int rowsAffected = stmt.executeUpdate();  // Execute the update query
            
            // Redirect back to the consultant dashboard after approval
            if (rowsAffected > 0) {
                response.sendRedirect("culturalConsultant.jsp"); // Redirect to the list of products for approval
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found.");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error approving product.");
        } finally {
            // Clean up database connections
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
