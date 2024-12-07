package admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FetchArtisans")
public class FetchartisanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FetchartisanServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft", "root", "Chandu_0000");

            // Corrected SQL query to fetch customer details
            String query = "SELECT id, username, email, phone, address FROM users WHERE role = 'artisan'";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            // Store customer details in a list
            ArrayList<Customer> customers = new ArrayList<>();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setUsername(rs.getString("username"));
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone"));
                customer.setAddress(rs.getString("address"));
                customers.add(customer);
            }

            conn.close();

            // Set the customer list as a request attribute
            request.setAttribute("customers", customers);

            // Forward the request to the JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("/artisansretrive.jsp");  // Update to correct JSP path
            dispatcher.forward(request, response);

        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
