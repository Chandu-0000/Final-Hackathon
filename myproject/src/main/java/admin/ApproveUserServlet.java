package admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ApproveUserServlet")
public class ApproveUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ApproveUserServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        Connection conn = null;

        try {
            // Load JDBC driver and establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft", "root", "Chandu_0000");

            // Update the user with the given ID to set approved = true
            String query = "UPDATE users SET approved = true WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, userId);
            int result = stmt.executeUpdate();

            if (result > 0) {
                // Successfully approved the user
                response.sendRedirect("FetchUnapprovedUsers"); // Redirect to the list of unapproved users
            } else {
                // Failure (should not happen)
                response.sendRedirect("error.jsp?error=Approval failed");
            }

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
