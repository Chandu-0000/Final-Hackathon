package customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/managecustomerProducts")
public class MangeCustomerproducts extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/handicraft";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Chandu_0000";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM products WHERE is_approved = 1")) {

            out.println("<div class='product-grid'>");

            while (resultSet.next()) {
                // Product details
                int productId = resultSet.getInt("id");
                String productName = resultSet.getString("name");
                double productPrice = resultSet.getDouble("price");
                String productImage = resultSet.getString("image");
                String productDescription = resultSet.getString("description");
                int productStock = resultSet.getInt("stock");

                // Product item HTML
                out.println("<div class='product-item'>");
                out.println("<img src='uploads/" + productImage + "' alt='" + productName + "' class='product-image' />");
                out.println("<h3>" + productName + "</h3>");
                out.println("<p class='description'>" + productDescription + "</p>");
                out.println("<p class='price'>Price: $" + productPrice + "</p>");
                out.println("<p class='stock'>Stock: " + productStock + "</p>");

                // Add to Cart button
                out.println("<button class='add-to-cart' data-id='" + productId + "' data-name='" + productName + "' data-price='" + productPrice + "'>Add to Cart</button>");
                out.println("</div>");
            }

            out.println("</div>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h2>Error retrieving products</h2>");
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
