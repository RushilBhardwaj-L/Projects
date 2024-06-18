<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.io.*, java.util.ArrayList, java.util.List" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>DocScans</title>
<style>
table{
	font-family: Arial, sans-serif;
    font-size: 35px;
    margin: 0 auto;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 50px;
    padding: 10px;
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
input[type="number"] {
    font-family: Arial, sans-serif;
    width: calc(100% - 20px);
    padding: 8px;
    margin-top: 6px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="text"]:hover,
input[type="number"]:hover{
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
    <div class="container">
        <form action="Display.jsp" method="post">
            <label for="houseID">Enter House ID:</label>
            <input type="text" id="houseID" name="House_ID" required>
            <input type="submit" value="View Task Logs">
        </form>
        
        <%
        String username = request.getParameter("House_ID");
                
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {  		
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javafs", "root", "root");
            ps = con.prepareStatement("SELECT * FROM createtask WHERE House_ID =?");
            ps.setString(1, username);
            rs = ps.executeQuery();
            
            List<String[]> data = new ArrayList<>();
            ResultSetMetaData rsmd = rs.getMetaData();
            int totalColumns = rsmd.getColumnCount();
            
            while(rs.next()) {
                String[] rowData = new String[totalColumns];
                for (int i = 1; i <= totalColumns; i++) {
                    rowData[i - 1] = rs.getString(i);
                }
                data.add(rowData);
            }
            
            if (data.isEmpty()) {
                out.print("<p>No documents found for ID: " + username + "</p>");
            } else {
                out.print("<table border='1'>");
                out.print("<caption>Your House Building Task logs:</caption>");
                out.print("<tr>");
                for (int i = 1; i <= totalColumns; i++) {
                    out.print("<th>" + rsmd.getColumnName(i) + "</th>");
                }
                out.print("</tr>");
                
                for (String[] rowData : data) {
                    out.print("<tr>");
                    for (String value : rowData) {
                        out.print("<td>" + value + "</td>");
                    }
                    out.print("</tr>");
                }
                out.print("</table>");
            }
        } catch(Exception e) {
            out.print("Error: " + e.getMessage());
            // Log the exception for debugging purposes
            e.printStackTrace();
        } finally {
            // Close resources in reverse order of their creation
            try { if (rs != null) rs.close(); } catch (SQLException e) { /* ignored */ }
            try { if (ps != null) ps.close(); } catch (SQLException e) { /* ignored */ }
            try { if (con != null) con.close(); } catch (SQLException e) { /* ignored */ }
        }
        %>
    </div>
    <div class="container" style="text-align: center;">
        <form action="Main.jsp" method="post">
            <input type="submit" value="Dashboard"> 
        </form>
    </div>
</body>
</html>
