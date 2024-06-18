<%@page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<body>

<%

    // Form parameters
    int flag=0;
    String usernameInput = request.getParameter("username");
    String passwordInput = request.getParameter("password");

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        // Load the MySQL driver
        Class.forName("com.mysql.jdbc.Driver");

        // Establish a connection to the database
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javafs","root","root");

        // Prepare SQL query
        String query = "SELECT * FROM Member WHERE username=? AND password=?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, usernameInput);
        preparedStatement.setString(2, passwordInput);

        // Execute the query
        resultSet = preparedStatement.executeQuery();

        // Check if the user exists
        if (resultSet.next()) {
            // User exists, redirect to success page or do further processing
            response.sendRedirect("Main.jsp");
        } else {
            // User does not exist, redirect to error page or display error message
            flag=1;
        }
    } catch (SQLException e) {
        // Handle SQL exceptions
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        // Handle class not found exception
        e.printStackTrace();
    } finally {
        // Close JDBC objects
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            // Handle SQL exceptions
            e.printStackTrace();
        }
    }
    
    if (flag==1) {
    	 request.setAttribute("message", "Login Failed");
    }
%>

<script>
        // Get the message from the request attribute
        var message = "<%= request.getAttribute("message") %>";

        // Check if the message is not null or empty
        if (message) {
            // Display an alert with the message
            alert(message);
           window.location.href = "LoginMember.jsp";
        }
    </script>

</body>
</html>