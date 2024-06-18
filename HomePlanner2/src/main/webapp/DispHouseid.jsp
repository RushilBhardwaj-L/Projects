<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.io.*" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Display by House ID</title>
    <style>
        table {
            font-family: Arial, sans-serif;
            
            margin: 0 auto;
        }

        body {
            font-family: Arial, sans-serif;
        	background-image: url('Background2.png');
			background-size: cover;
			background-position: center;
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

        input[type="text"] {
            font-family: Arial, sans-serif;
            width: calc(100% - 20px);
            padding: 8px;
            margin-top: 6px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="text"]:hover {
            background-color: #FFC0CB;
        }

        button[type="submit"] {
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

        button[type="submit"]:hover {
            background-color: #FFC0CB;
        }
        
        nav {
    width: auto;
    margin: 10px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}


nav ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

nav ul li {
    display: inline;
    margin-right: 50px;
}

nav ul li a {
    text-decoration: none;
    color: #000;
}

nav ul li a:hover {
    text-decoration: underline;
    color: #FFC0CB;
}
    </style>
</head>
<body>
    <nav>
        <ul>
            <li><a href="Create.jsp">Create</a></li>
            <li><a href="Update.jsp">Update</a></li>
            <li><a href="Delete.jsp">Delete</a></li>
            <li><a href="DisplayDetails.jsp">List</a></li>
            <li><a href="Main.jsp">Dashboard</a></li>
        </ul>
    </nav>
    <div class="container">
        <h2>Display by House ID</h2>
        <form action="" method="post">
            <label for="houseid">Enter House ID:</label><br>
            <input type="text" id="houseid" name="houseid" required><br><br>
            <button type="submit">Submit</button>
        </form>
        <br>
        <table border="1">
            <tr>
                <th>House ID</th>
                <th>Status</th>
                <th>Location</th>
                <th>Size</th>
                <th>Color</th>
                <th>Budget</th>
                <!-- Add more table headers as needed -->
            </tr>
            <% 
                String houseid = request.getParameter("houseid");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javafs", "root", "root");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM createtask WHERE House_ID='" + houseid + "'");
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("House_ID") + "</td>");
                        out.println("<td>" + rs.getString("Status") + "</td>");
                        out.println("<td>" + rs.getString("Location") + "</td>");
                        out.println("<td>" + rs.getString("Size") + "</td>");
                        out.println("<td>" + rs.getString("Color") + "</td>");
                        out.println("<td>" + rs.getString("Budget") + "</td>");
                        // Add more columns as needed
                        out.println("</tr>");
                    }
                    conn.close();
                } catch (Exception e) {
                    out.println("Error: " + e);
                }
            %>
        </table>
    </div>
</body>
</html>
