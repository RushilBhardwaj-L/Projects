<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register</title>
    <style>
    
table{
	font-family: Arial, sans-serif;
    font-size: 35px;
    margin: 0 auto;
}
    
body {
    font-family: Arial, sans-serif;
    margin: 50px;
    padding: 10px;
    text-align: center;
	background-image: url('Background2.png');
	background-size: cover;
	background-position: center;
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
	background-color: #8497A3;
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

input[type="password"] {
    font-family: Arial, sans-serif;
    width: calc(100% - 20px);
    padding: 8px;
    margin-top: 6px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    align-text:center;
}

input[type="password"]:hover {
    background-color: #FFC0CB;
}
    
    </style>
</head>
<body>
    <table><tr><td><u>REGISTRATION FORM</u></td></tr></table>
    <form action="memberServlet" method="post">
<label for='id'>Registration Id</label>
<input type="text"name="id"/>
<label for='first_name'>First Name</label>
<input type="text"name="first_name"/>
<label for='last_name'>Last Name</label>
<input type="text"name="last_name"/>
<label for='username'>Username</label>
<input type="text"name="username"/>
<label for='password'>Password</label>
<input type="password"name="password"/>
<label for='address'>Address</label>
<input type="text"name="address"/>
<label for='contact'>Contact</label>
<input type="text"name="contact"/>
<input type="submit"value="Submit"/></form>
</body>
</html>