<!-- <form action="action_page.php">
  <div class="container">
    <h1>New user Register for DevOps Learning</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
     
    <label for="Name"><b>Enter Name</b></label>
    <input type="text" placeholder="Enter Full Name" name="Name" id="Name" required>
    <br>
    
    <label for="mobile"><b>Enter mobile</b></label>
    <input type="text" placeholder="Enter moible number" name="mobile" id="mobile" required>
    <br>

    <label for="email"><b>Enter Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" id="email" required>
    <br>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" id="psw" required>
    <br>

    <label for="psw-repeat"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" required>
    <hr>
    <br>
    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
    <button type="submit" class="registerbtn">Register</button>
  </div>
  <div class="container signin">
    <p>Already have an account? <a href="#">Sign in</a>.</p>
  </div>

   <h1> Thankyou, Happy Learning </h1>

  
</form> -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <style>
        /* CSS styles for the registration form container */
        .registration-container {
            width: 600px; /* Set the width of the container */
            margin: 0 auto; /* Center the container horizontally */
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
    <h2 class="registration-heading">Registration Form</h2>
    <form action="registration_handler.jsp" method="post">
        <label for="firstname">First Name:</label>
        <input type="text" id="firstname" name="firstname" class="input-field" required><br>

        <label for="lastname">Last Name:</label>
        <input type="text" id="lastname" name="lastname" class="input-field" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" class="input-field" required><br>

        <label for="mobile">Mobile Number:</label>
        <input type="tel" id="mobile" name="mobile" class="input-field" required><br>

        <label for="address">Address:</label>
        <textarea id="address" name="address" class="input-field" required></textarea><br>

        <label for="branch">Branch:</label>
        <input type="text" id="branch" name="branch" class="input-field" required><br>

        <label for="year">Year:</label>
        <input type="text" id="year" name="year" class="input-field" required><br>

        <label for="percentage">Percentage:</label>
        <input type="text" id="percentage" name="percentage" class="input-field" required><br>

        <input type="submit" value="Register">
    </form>
</div>

</body>
</html>
