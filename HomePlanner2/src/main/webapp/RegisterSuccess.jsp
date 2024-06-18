<html>
<body>
<%
	request.setAttribute("message", "Registered Successfully");
%>

<script>
        // Get the message from the request attribute
        var message = "<%= request.getAttribute("message") %>";

        // Check if the message is not null or empty
        if (message) {
            // Display an alert with the message
            alert(message);
           window.location.href = "RegisterLogin.jsp";
        }
</script>
</body>
</html>