package artisan;

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
import javax.servlet.http.HttpSession;

//@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username"); // Assume username is stored in the session

        org.json.simple.JSONObject profileData = new org.json.simple.JSONObject();

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft", "root", "Chandu_0000");

            // Query to fetch artisan details
            String query = "SELECT email, phone, address FROM users WHERE username = ? AND role = 'artisan'";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                profileData.put("email", rs.getString("email"));
                profileData.put("phone", rs.getString("phone"));
                profileData.put("address", rs.getString("address"));
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        response.getWriter().write(profileData.toString());
    }
}
