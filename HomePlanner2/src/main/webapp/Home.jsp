 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login or Register</title>
    <link rel="stylesheet" href="styles.css">
<style>
body {
    font-family: Arial, sans-serif;
    
    margin: 0;
    padding: 0;
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
    text-align: center;
}

h2 {
    color: #333;
}

.button-container {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

button {
    padding: 10px 20px;
    margin: 0 10px;
    border: none;
    border-radius: 4px;
    background-color: #007bff;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #0056b3;
}

</style>
</head>
<body>
    <div class="container">
        <h2>Welcome!</h2>
        <div class="button-container">
            <form action="LoginMember.jsp" method="post">
                <button type="submit">Login</button>
            </form>
            <form action="RegisterMember.jsp" method="post">
                <button type="submit">Register</button>
            </form>
        </div>
    </div>
</body>
</html>