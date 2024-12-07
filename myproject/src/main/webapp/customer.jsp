<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("customerLogin.jsp");
    }
    Integer cartCount = (Integer) session.getAttribute("cartCount");
    if (cartCount == null) {
        cartCount = 0;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f4f4f9;
        }

        header {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 10px 0;
        }

        nav ul {
            display: flex;
            justify-content: center;
            list-style: none;
            background-color: #333;
            padding: 10px 0;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
        }

        nav ul li a:hover {
            background-color: #4CAF50;
        }

        .container {
            flex: 1;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
        }

        .welcome h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            width: 100%;
            max-width: 1200px;
            margin: auto;
        }

        .product {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .product:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .product img {
            max-width: 100%;
            height: auto;
            max-height: 150px;
            object-fit: cover;
            border-radius: 5px;
        }

        .product h3 {
            font-size: 16px;
            margin: 10px 0;
            color: #4CAF50;
        }

        .product p {
            font-size: 14px;
            color: #555;
        }

        .product button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .product button:hover {
            background-color: #45a049;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <header>
        <h1>Customer Dashboard</h1>
    </header>

    <nav>
        <ul>
            <li><a href="login.jsp">Home</a></li>
<li><a href="CustomerProfileServlet">Profile</a></li>
            <li><a href="shop.jsp">Shop</a></li>
            <li><a href="cart.jsp">Cart </a></li>
            
            <li><a href="login.jsp">Logout</a></li>
        </ul>
    </nav>

    <div class="container">
        <div class="welcome">
            <h2>Welcome, <%= username %>!</h2>
        </div>

        <div class="product-grid" id="product-grid">
            <!-- Dynamic products will load here from loadProducts.js -->
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Handicrafts Platform</p>
    </footer>
    <script src="js/loadProducts.js"></script>
    
</body>
</html>
