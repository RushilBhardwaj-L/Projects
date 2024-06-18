<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
<style>
table{
	font-family: Arial, sans-serif;
    font-size: 35px;
    margin: 0 auto;
}

body {
    font-family: Arial, sans-serif;
    background-image: url('Background2.png');
	background-size: cover;
	background-position: center;
    margin: 10px;
    padding: 20px;
    text-align: center;
}

.container {
    width: 50%;
    margin: 50px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    color: #000000;
}

form {
    margin-top: 20px;
}

label {
    font-weight: bold;
    color: #333;
}
input[type="text"],input[type="password"] {
    width: 60%;
    padding: 8px;
    margin-top: 6px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    display: block;
    margin: 0 auto;
}

input[type="text"]:hover,input[type="password"]:hover {
	background-color: #FFC0CB;
}

input[type="submit"] {
	border: none;
	background-color: #ffffff;
    color: black;
    padding: 12px 20px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
    display: inline-block;
    
}

input[type="submit"]:hover {
    background-color: #FFC0CB;
}



</style>
</head>
<body>
    <h1>Forgot Password</h1>
    <!-- Include database connection -->
    <%  Connection connection = null;
        try {
            // Load the MySQL driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            String url = "jdbc:mysql://localhost:3306/javafs";
            String username = "root";
            String password = "root";
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            out.println("Class not found: " + e.getMessage());
        } catch (SQLException e) {
            out.println("SQL Exception: " + e.getMessage());
        }
    %>
	<%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && password != null) {
            try {
                // Update the password in the database
                String updateQuery = "UPDATE member SET Password = ? WHERE Username = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
                preparedStatement.setString(1, password);
                preparedStatement.setString(2, username);
                int rowsAffected = preparedStatement.executeUpdate();
                if (rowsAffected > 0) {
    %>
                    <p>Password updated successfully!</p>
    <%
                } else {
    %>
                    <p>Failed to update password.</p>
    <%
                }
            } catch (SQLException e) {
                out.println("SQL Error: " + e.getMessage());
            }
        }
    %>
    <form action="Main.jsp" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">New Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
