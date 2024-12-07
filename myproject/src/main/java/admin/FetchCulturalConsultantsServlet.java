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

@WebServlet("/FetchCulturalConsultants")
public class FetchCulturalConsultantsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FetchCulturalConsultantsServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/handicraft", "root", "Chandu_0000");

            // SQL query to fetch cultural consultants
            String query = "SELECT id, username, email, phone, address FROM users WHERE role = 'culturalConsultant'";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            // Store the cultural consultants in a list
            ArrayList<Customer> culturalConsultants = new ArrayList<>();
            while (rs.next()) {
                Customer consultant = new Customer();
                consultant.setId(rs.getInt("id"));
                consultant.setUsername(rs.getString("username"));
                consultant.setEmail(rs.getString("email"));
                consultant.setPhone(rs.getString("phone"));
                consultant.setAddress(rs.getString("address"));
                culturalConsultants.add(consultant);
            }

            conn.close();

            // Set the cultural consultant list as a request attribute
            request.setAttribute("culturalConsultants", culturalConsultants);

            // Forward to the JSP page to display the cultural consultants
            RequestDispatcher dispatcher = request.getRequestDispatcher("/culturalConsultantsList.jsp");  // JSP page to show data
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
