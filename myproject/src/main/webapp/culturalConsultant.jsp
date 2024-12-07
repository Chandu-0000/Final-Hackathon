<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <title>Cultural Consultant Dashboard</title>
</head>
<body>
    <header>
        <h1>Cultural Consultant Dashboard</h1>
        <nav>
            <a href="login.jsp">Home</a>
        </nav>
    </header>
    <main>
        <h2>Approve Artisan Content</h2>
        <div class="product-grid">
            <% 
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft", "root", "Chandu_0000");
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM products WHERE is_approved = 0"); // Only not approved products

                    while (rs.next()) {
                        out.println("<div class='product-item'>");
                        out.println("<img src='uploads/" + rs.getString("image") + "' alt='" + rs.getString("name") + "' class='product-image' />");
                        out.println("<h3>" + rs.getString("name") + "</h3>");
                        out.println("<p class='description'>" + rs.getString("description") + "</p>");
                        out.println("<p class='price'>Price: $" + rs.getDouble("price") + "</p>");
                        
                        // Approve Form
                        out.println("<form method='POST' action='approveProduct'>");
                        out.println("<input type='hidden' name='productId' value='" + rs.getInt("id") + "' />");
                        out.println("<button type='submit'>Approve</button>");
                        out.println("</form>");

                        // Delete Form
                        out.println("<form method='POST' action='deleteProduct'>");
                        out.println("<input type='hidden' name='productId' value='" + rs.getInt("id") + "' />");
                        out.println("<button type='submit'>Delete</button>");
                        out.println("</form>");
                        
                        out.println("</div>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Handicrafts Platform</p>
    </footer>
</body>
</html>
