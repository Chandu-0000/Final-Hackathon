package artisan;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.gson.Gson;

import java.io.*;
import java.sql.*;
import java.util.*;

@WebServlet("/getNotifications")
public class GetNotificationsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int artisanId = Integer.parseInt(request.getParameter("artisanId"));  // Get artisan ID from session

        List<Map<String, String>> notifications = new ArrayList<>();
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft", "root", "Chandu_0000");
            
            String query = "SELECT * FROM notifications WHERE artisan_id = ? ORDER BY created_at DESC";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, artisanId);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Map<String, String> notification = new HashMap<>();
                notification.put("message", rs.getString("message"));
                notifications.add(notification);
            }
            
            // Return notifications as JSON
            response.setContentType("application/json");
            response.getWriter().write(new Gson().toJson(notifications));  // You can use Gson or any other library to convert to JSON
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching notifications.");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
