<!DOCTYPE html>
<html>
<head>
    <title>User Input Form</title>
</head>
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

input[type="text"] {
    width: 60%;
    padding: 8px;
    margin-top: 6px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    display: block;
    margin: 0 auto;
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

button[type="button"] {
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

button[type="button"]:hover {
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

select {
            font-family: Arial, sans-serif;
            width: 61%;
            padding: 8px;
            margin-top: 6px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        select:hover {
            background-color: #FFC0CB;
        }

</style>
<body>
    <nav>
        <ul>
            <li><a href="Update.jsp">Update</a></li>
            <li><a href="DisplayDetails.jsp">List</a></li>
            <li><a href="Delete.jsp">Delete</a></li>
            <li><a href="Main.jsp">Dashboard</a></li>
        </ul>
    </nav>
    <table><tr><td><u>TASK REGISTRATION FORM</u></td></tr><table></table><br>
    <form id="CreateTask" method="post" action="CreateTask">
        <!-- Your form inputs -->
        <label>House_ID:</label>
        <input type="text" name="House_ID" required><br>
        
        <label>Build Status:</label><br>
        <select id="Status" name="Status">
                <option value="" disabled selected>Please select an option</option>
                <option value="Pending">Pending</option>
                <option value="On-Going">On-Going</option>
                <option value="Completed">Completed</option>
                    
        </select><br>
        
        <label>Location:</label><br>
        <select id="Location" name="Location">
                <option value="" disabled selected>Please select an option</option>
                <option value="Karnataka">Karnataka</option>
                <option value="Kerala">Kerala</option>
                <option value="Tamil Nadu">Tamil Nadu</option>
                    
        </select><br>
        
        <label>Size:</label>
        <input type="text" name="Size" required><br>
        
        <label>Color:</label>
        <input type="text" name="Color" required><br>
           
        <label>Budget:</label>
        <input type="text" name="Budget" required><br><br>
        
        <button type="submit">Submit</button>
        <button type="button" onclick="redirectTo('Main.jsp')">Dashboard</button>
    </form>
    <script type="text/javascript">
        function redirectTo(url) {
        	window.location.href = url;
        }
    </script>
</body>
</html>