<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Handler</title>
    <style>
        /* CSS styles for the registration form container */
        .registration-container {
             
            width: 600px; /* Set the width of the container */
            margin: 20px auto; /* Center the container horizontally with some top margin */
            padding: 20px; /* Add some padding inside the container */
            border: 2px solid #ccc; /* Add a border */
            border-radius: 10px; /* Add some border radius */
            background-color: #f9f9f9; /* Background color */
        }

        /* CSS styles for the heading */
        .registration-heading {
            text-align: center; /* Center the heading text */
        }

        /* CSS styles for input fields */
        .input-field {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
        }
    </style>
</head>
<body>

<div class="registration-container">
    <h2 class="registration-heading">Registration Details</h2>
    <%
        // Retrieve form data
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String branch = request.getParameter("branch");
        String year = request.getParameter("year");
        String percentage = request.getParameter("percentage");
    %>
    <p><strong>First Name:</strong> <%= firstName %></p>
    <p><strong>Last Name:</strong> <%= lastName %></p>
    <p><strong>Email:</strong> <%= email %></p>
    <p><strong>Mobile Number:</strong> <%= mobile %></p>
    <p><strong>Address:</strong> <%= address %></p>
    <p><strong>Branch:</strong> <%= branch %></p>
    <p><strong>Year:</strong> <%= year %></p>
    <p><strong>Percentage:</strong> <%= percentage %></p>
</div>

</body>
</html>
