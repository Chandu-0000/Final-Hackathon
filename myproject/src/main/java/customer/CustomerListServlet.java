package customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/CustomerProfileServlet")
public class CustomerListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username"); // Retrieve the username from session

        // Create a Customer object to hold the profile data
        Customer customer = new Customer();

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft", "root", "Chandu_0000");

            // Query to fetch customer details based on the username from session
            String query = "SELECT id, username, email, phone, address FROM users WHERE username = ? AND role = 'customer'";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Set the fetched data into the Customer object
                customer.setId(rs.getInt("id"));
                customer.setUsername(rs.getString("username"));
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone"));
                customer.setAddress(rs.getString("address"));
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set the customer object in request to forward to JSP
        request.setAttribute("customer", customer);

        // Forward the request to the profile JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
        dispatcher.forward(request, response);
    }
}
