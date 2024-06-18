package homePlanner;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class memloyeeServlet
 */
public class memberServlet extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    int id = Integer.valueOf(request.getParameter("id"));
    String fn = request.getParameter("first_name");
    String ln = request.getParameter("last_name");
    String un = request.getParameter("username");
    String pwd = request.getParameter("password");
    String addr = request.getParameter("address");
    String cont = request.getParameter("contact");
    Member mem = new Member();
    mem.setId(id);
    mem.setfirst_name(fn);
    mem.setlast_name(ln);
    mem.setUsername(un);
    mem.setPassword(pwd);
    mem.setAddress(addr);
    mem.setContact(cont);
    request.setAttribute("mem", mem);

    // Check if the user already exists
    if (userExists(un)) {
        // User already exists, prompt a message
        out.println("<script>alert('Username already exists. Please choose a different username.');</script>");
        // You can redirect back to the registration page or any other appropriate action
        // For example:
        RequestDispatcher rd = request.getRequestDispatcher("RegisterMember.jsp");
        rd.include(request, response);
    } else {
        // User doesn't exist, proceed with registration
        int result = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javafs", "root", "root");
            String query = "INSERT INTO Member (id, first_name, last_name, username, password, address, contact) VALUES (?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, mem.getId());
            preparedStatement.setString(2, mem.getfirst_name());
            preparedStatement.setString(3, mem.getlast_name());
            preparedStatement.setString(4, mem.getUsername());
            preparedStatement.setString(5, mem.getPassword());
            preparedStatement.setString(6, mem.getAddress());
            preparedStatement.setString(7, mem.getContact());
            result = preparedStatement.executeUpdate();
            // Redirect to registration success page
            RequestDispatcher rd = request.getRequestDispatcher("RegisterSuccess.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            System.err.println(e);
        }
    }
}

// Function to check if the user already exists in the database
private boolean userExists(String username) {
    boolean exists = false;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javafs", "root", "root");
        String query = "SELECT * FROM Member WHERE username=?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, username);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            // User already exists
            exists = true;
        }
        // Close the ResultSet, PreparedStatement, and Connection
        resultSet.close();
        preparedStatement.close();
        connection.close();
    } catch (Exception e) {
        System.err.println(e);
    }
    return exists;
}
}
