package customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/handicraft";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Chandu_0000";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Get the current session and the logged-in customer
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            out.write("{\"success\": false, \"message\": \"User not logged in.\"}");
            return;
        }

        // Get the product details from the request body
        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String productPrice = request.getParameter("productPrice");

        // Add the product to the cart in the database
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Find or create the cart for the user
            String query = "INSERT INTO cart (username, product_id, product_name, product_price) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, username);
                stmt.setString(2, productId);
                stmt.setString(3, productName);
                stmt.setString(4, productPrice);

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    // Calculate the cart count
                    String countQuery = "SELECT COUNT(*) FROM cart WHERE username = ?";
                    try (PreparedStatement countStmt = conn.prepareStatement(countQuery)) {
                        countStmt.setString(1, username);
                        ResultSet rs = countStmt.executeQuery();
                        int cartCount = 0;
                        if (rs.next()) {
                            cartCount = rs.getInt(1);
                        }

                        // Return the updated cart count
                        out.write("{\"success\": true, \"cartCount\": " + cartCount + "}");
                    }
                } else {
                    out.write("{\"success\": false, \"message\": \"Failed to add product to cart.\"}");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.write("{\"success\": false, \"message\": \"Database error.\"}");
        }
    }
}
