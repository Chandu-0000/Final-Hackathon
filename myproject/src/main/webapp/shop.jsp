<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="customer.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <title>Shop - Handicrafts Platform</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }

        .product-card {
            background: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .product-card img {
            max-width: 100%;
            height: 150px;
            object-fit: cover;
            margin-bottom: 10px;
            border-radius: 5px;
        }

        .product-card h3 {
            font-size: 16px;
            margin: 10px 0;
            color: #4CAF50;
        }

        .product-card p {
            font-size: 14px;
            color: #555;
        }

        .add-to-cart {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        .add-to-cart:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <header>
        <h1>Shop - Handicrafts Platform</h1>
    </header>

    <div id="product-grid" class="product-grid">
        <!-- Products will be populated here by JavaScript -->
    </div>

    <script src="js/customer.js"></script>
        <script src="js/shop.js"></script>
    
</body>
</html>
