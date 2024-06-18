package homePlanner;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class UpdateTask extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // JDBC driver name and database URL
        final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
        final String DB_URL = "jdbc:mysql://localhost:3306/javafs";

        // Database credentials
        final String USER = "root";
        final String PASS = "root";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Register JDBC driver
            Class.forName(JDBC_DRIVER);

            // Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // Get parameters from the form
            String houseId = request.getParameter("House_ID");
            String buildStatus = request.getParameter("Status");
            String color = request.getParameter("Color");
            String budget = request.getParameter("Budget");

            // SQL query to update the database
            String sql = "UPDATE createtask SET Status=?, Color=?, Budget=? WHERE House_ID=?";

            // Create PreparedStatement
            pstmt = conn.prepareStatement(sql);

            // Set parameters
            pstmt.setString(1, buildStatus);
            pstmt.setString(2, color);
            pstmt.setString(3, budget);
            pstmt.setString(4, houseId);

            // Execute SQL query
            pstmt.executeUpdate();

            out.println("<script>alert('Details Updated Successfully!');</script>");
            RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
            rd.include(request, response);

        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
