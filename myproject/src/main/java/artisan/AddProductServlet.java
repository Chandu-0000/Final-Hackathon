package artisan;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

//@WebServlet("/addProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,  // 2 MB
                 maxFileSize = 1024 * 1024 * 10,       // 10 MB
                 maxRequestSize = 1024 * 1024 * 50)    // 50 MB
public class AddProductServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/handicraft";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Chandu_0000";
    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        String priceParam = request.getParameter("price");
        String stockParam = request.getParameter("stock");
        Part imagePart = request.getPart("image");

        // Validate inputs
        if (productName == null || productName.trim().isEmpty() ||
            description == null || description.trim().isEmpty() ||
            priceParam == null || priceParam.trim().isEmpty() ||
            stockParam == null || stockParam.trim().isEmpty() ||
            imagePart == null || imagePart.getSize() == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are required.");
            return;
        }

        double price;
        int stock;
        
        try {
            price = Double.parseDouble(priceParam);
            stock = Integer.parseInt(stockParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid price or stock value.");
            return;
        }

        String imageFileName = imagePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String imagePath = uploadPath + File.separator + imageFileName;
        imagePart.write(imagePath);

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement statement = connection.prepareStatement(
                 "INSERT INTO products (name, description, price, stock, image) VALUES (?, ?, ?, ?, ?)")) {

            statement.setString(1, productName);
            statement.setString(2, description);
            statement.setDouble(3, price);
            statement.setInt(4, stock);
            statement.setString(5, imageFileName);

            statement.executeUpdate();

            response.sendRedirect("artisan.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error adding product");
        }
    }
}
