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

@WebServlet("/FetchUnapprovedUsers")
public class FetchUnapprovedUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Default constructor
    public FetchUnapprovedUsersServlet() {
        super();
    }

    // Handles GET requests to fetch unapproved users
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null;

        try {
            // Load JDBC driver and establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft", "root", "Chandu_0000");

            // Query to fetch users where approved is false
            String query = "SELECT id, username, email, phone, address, role FROM users WHERE approved = false";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            // Create a list to store unapproved users
            ArrayList<User> unapprovedUsers = new ArrayList<>();
            
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
                unapprovedUsers.add(user);
            }

            // Set the list as a request attribute
            request.setAttribute("unapprovedUsers", unapprovedUsers);

            // Forward to JSP page to display the unapproved users
            RequestDispatcher dispatcher = request.getRequestDispatcher("/unapprovedUsersList.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?error=" + e.getMessage());
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // Handles POST requests (delegates to doGet)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
