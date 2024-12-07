package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String role = request.getParameter("role");

        try {
            // Validate username: 6-30 characters, alphanumeric + underscores, starts with a letter
            if (username == null || 
                !Pattern.matches("^[A-Za-z][A-Za-z0-9_]{5,29}$", username)) {
                response.sendRedirect("signup.jsp?error=Invalid username. Must be 6-30 characters, alphanumeric or underscores, starting with a letter.");
                return;
            }

            // Validate email: Must end with @gmail.com
            if (email == null || 
                !Pattern.matches("^[A-Za-z0-9._%+-]+@gmail\\.com$", email)) {
                response.sendRedirect("signup.jsp?error=Invalid email. Must end with @gmail.com.");
                return;
            }

            // Validate password: At least 8 characters, with uppercase, lowercase, and a number
            if (password == null || 
                !Pattern.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$", password)) {
                response.sendRedirect("signup.jsp?error=Invalid password. Must be 8+ characters, include uppercase, lowercase, and a number.");
                return;
            }

            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft", "root", "Chandu_0000");

            // Hash the password for security
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            // Insert the user into the database with approved set to false
            String query = "INSERT INTO users (username, password, email, phone, address, role, approved) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, hashedPassword);
            stmt.setString(3, email);
            stmt.setString(4, phone);
            stmt.setString(5, address);
            stmt.setString(6, role);
            stmt.setBoolean(7, false); // New users are not approved by default

            int result = stmt.executeUpdate();

            if (result > 0) {
                // Redirect to the login page after signup
                response.sendRedirect("login.jsp");
            } else {
                response.sendRedirect("signup.jsp?error=Signup failed");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp?error=Database error");
        }
    }
}
