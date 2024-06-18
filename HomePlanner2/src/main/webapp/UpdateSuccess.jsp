<!DOCTYPE html>
<html>
<head>
    <title>Task Creation Status</title>
    <script type="text/javascript">
        function showAlert() {
            alert("Task Update Successfully!");
        }

        function goToHome() {
            window.location.href = "Home.jsp";
        }

        function createAnotherTask() {
            window.location.href = "Update.jsp";
        }
    </script>
</head>
<body onload="showAlert()">
    <h2>Task Creation Status</h2>
    <div>
        <button onclick="goToHome()">Home</button>
        <button onclick="createAnotherTask()">Create Another Task</button>
    </div>
</body>
</html>
