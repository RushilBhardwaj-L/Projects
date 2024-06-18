<html>
<body>
<%
	request.setAttribute("message", "Task Deleted Successfully");
%>

<script>
        // Get the message from the request attribute
        var message = "<%= request.getAttribute("message") %>";

        // Check if the message is not null or empty
        if (message) {
            // Display an alert with the message
            alert(message);
           window.location.href = "Main.jsp";
        }
</script>
</body>
</html>