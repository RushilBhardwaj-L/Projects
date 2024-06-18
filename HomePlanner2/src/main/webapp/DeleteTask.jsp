<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.io.*" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Delete Record</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
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
    color: #333;
}

form {
    margin-top: 20px;
}

label {
    font-weight: bold;
    color: #333;
}

input[type="text"],
input[type="submit"] {
    width: calc(100% - 20px);
    padding: 8px;
    margin-top: 6px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #d9534f;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
    font-size: 16px;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #c9302c;
}

p {
    text-align: center;
    color: #333;
    font-weight: bold;
}

</style>    
</head>
<body>
    <div class="container">
        <h2>Delete Record</h2>
        <form action="DeleteRecord.jsp" method="post">
            <label for="recordID">Enter Record ID:</label>
            <input type="text" id="recordID" name="Record_ID" required>
            <input type="submit" value="Delete">
        </form>
        
        <% 
        String recordID = request.getParameter("House_ID");
                
        Connection con = null;
        PreparedStatement ps = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javafs", "root", "root");
            ps = con.prepareStatement("DELETE FROM createtask WHERE House_ID = ?");
            ps.setString(1, recordID);
            int rowsAffected = ps.executeUpdate();
            RequestDispatcher rd = request.getRequestDispatcher("DeleteSuccessful.jsp");
            rd.include(request, response);
            
            if (rowsAffected > 0) {
        %>
        <p>Record with ID <%= recordID %> has been successfully deleted.</p>
        <%
            } else {
        %>
        <p>No record found with ID <%= recordID %>.</p>
        <%
            }
        } catch(Exception e) {
            out.print("Error: " + e.getMessage());
            // Log the exception for debugging purposes
            e.printStackTrace();
        } finally {
            // Close resources in reverse order of their creation
            try { if (ps != null) ps.close(); } catch (SQLException e) { /* ignored */ }
            try { if (con != null) con.close(); } catch (SQLException e) { /* ignored */ }
        }
        %>
    </div>
</body>
</html>
