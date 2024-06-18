<!DOCTYPE html>
<html>
<head>
    <title>Hyperlink Page</title>
<style>
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

h1 {
    text-align: center;
    color: #333;
}

.link-container {
    display: flex;
    flex-direction: column;
}

.link-container a {
    display: block;
    padding: 10px;
    margin-bottom: 10px;
    text-decoration: none;
    color: #333;
    border: 1px solid #ccc;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.link-container a:hover {
    background-color: #FFC0CB;
}

</style>    
</head>
<body>
    <div class="container">
        <h1>Welcome to Home Planner</h1>
        <div class="link-container">
            <a href="Create.jsp">Create Plan</a>
            <a href="DisplayDetails.jsp">Retrieve Plan</a>
            <a href="Update.jsp">Update Plan</a>
            <a href="Delete.jsp">Delete Plan</a>
            <a href="Gallery.jsp">Gallery</a>
        </div>
    </div>
</body>
</html>
