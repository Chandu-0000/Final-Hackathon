<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <style>
        /* Styling for the products */
        .product-grid {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }
        .product-item {
            margin: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            width: 250px;
            text-align: center;
        }
        .product-item img {
            width: 100%;
            height: auto;
        }
        .price, .stock {
            font-weight: bold;
        }
        .description {
            color: #666;
            font-size: 0.9em;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Your Cart</h1>
    <div class="product-grid">
        <% 
            // Set up database connection
            String DB_URL = "jdbc:mysql://localhost:3306/handicraft";
            String DB_USER = "root";
            String DB_PASSWORD = "Chandu_0000";
            
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // Query to fetch the first 3 products
                String query = "SELECT * FROM products WHERE is_approved = 1 LIMIT 3";
                try (Statement statement = connection.createStatement();
                     ResultSet resultSet = statement.executeQuery(query)) {

                    while (resultSet.next()) {
                        // Product details
                        int productId = resultSet.getInt("id");
                        String productName = resultSet.getString("name");
                        double productPrice = resultSet.getDouble("price");
                        String productImage = resultSet.getString("image");
                        String productDescription = resultSet.getString("description");
                        int productStock = resultSet.getInt("stock");

                        // Output each product item
                        out.println("<div class='product-item'>");
                        out.println("<img src='uploads/" + productImage + "' alt='" + productName + "' class='product-image' />");
                        out.println("<h3>" + productName + "</h3>");
                        out.println("<p class='description'>" + productDescription + "</p>");
                        out.println("<p class='price'>Price: $" + productPrice + "</p>");
                        out.println("<p class='stock'>Stock: " + productStock + "</p>");
                        
                        // "Proceed to Checkout" button
                        out.println("<form action='checkout.jsp' method='POST'>");
                        out.println("<input type='hidden' name='productId' value='" + productId + "'>");
                        out.println("<input type='hidden' name='productName' value='" + productName + "'>");
                        out.println("<input type='hidden' name='productPrice' value='" + productPrice + "'>");
                        out.println("<input type='hidden' name='productStock' value='" + productStock + "'>");
                        out.println("<button type='submit' class='button'>Proceed to Checkout</button>");
                        out.println("</form>");
                        out.println("</div>");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<h2>Error retrieving products</h2>");
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        %>
    </div>
</body>
</html>
