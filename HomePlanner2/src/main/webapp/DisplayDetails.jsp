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
    text-align: center;
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

select:hover{
color: #FFC0CB;
}

select{
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

</style>
<body>
    <nav>
        <ul>
            <li><a href="Create.jsp">Create</a></li>
        <li><a href="Update.jsp">Update</a></li>
            <li><a href="Delete.jsp">Delete</a></li>
        </ul>
    </nav>

<table><tr><td><u>DISPLAY TASK FORM</u></td></tr><table></table><br>
    <form action="ProcessFormServlet" method="post">
    <select id="redirectSelect" name="display">
        <option value="" disabled selected>Please select an option</option>
        <option value="DispHouseid.jsp">Display by House ID</option>
        <option value="DispStatus.jsp">Display by Status</option>
        <option value="DispLocation.jsp">Display by Location</option>
    </select>
</form>
    <br><br><button type="submit" onclick="submitForm('Main')">Dashboard</button>
</div>
<script>
    function submitForm(action) {
        window.location.href = action === 'submit' ? 'ProcessFormServlet' : 'Main.jsp';
    }
        document.getElementById("redirectSelect").addEventListener("change", function() {
            var selectedOption = this.value;
            if (selectedOption) {
                window.location.href = selectedOption;
            }
        });
        </script>
</body>
</html>
