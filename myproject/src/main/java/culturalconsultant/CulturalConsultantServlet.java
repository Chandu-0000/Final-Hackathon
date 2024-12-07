package culturalconsultant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//@WebServlet("/culturalConsultant")
public class CulturalConsultantServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/handicraft";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Chandu_0000";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM products WHERE is_approved = false");
             ResultSet resultSet = statement.executeQuery()) {

            out.println("<div class='product-grid'>");
            while (resultSet.next()) {
                out.println("<div class='product-item'>");
                out.println("<img src='uploads/" + resultSet.getString("image") + "' alt='" + resultSet.getString("name") + "' class='product-image' />");
                out.println("<h3>" + resultSet.getString("name") + "</h3>");
                out.println("<p class='description'>" + resultSet.getString("description") + "</p>");
                out.println("<p class='price'>Price: $" + resultSet.getDouble("price") + "</p>");
                out.println("<p class='stock'>Stock: " + resultSet.getInt("stock") + "</p>");
                out.println("<form method='POST' action='culturalConsultant'>");
                out.println("<input type='hidden' name='productId' value='" + resultSet.getInt("id") + "' />");
                out.println("<button type='submit'>Approve</button>");
                out.println("</form>");
                out.println("</div>");
            }
            out.println("</div>");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving products");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement statement = connection.prepareStatement("UPDATE products SET is_approved = true WHERE id = ?")) {
            statement.setInt(1, productId);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error approving product");
        }

        response.sendRedirect("culturalConsultant");
    }
}
