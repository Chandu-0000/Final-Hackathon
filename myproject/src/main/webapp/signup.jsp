<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 110vh;
        }
        form {
            width: 100%;
            max-width: 400px;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #1E88E5;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="password"], input[type="email"], input[type="tel"], textarea, select {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus, input[type="tel"]:focus, textarea:focus, select:focus {
            border-color: #1E88E5;
            outline: none;
            box-shadow: 0 0 5px rgba(30, 136, 229, 0.3);
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #1E88E5;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #1565C0;
        }
        textarea {
            resize: vertical;
            height: 100px;
        }
        select {
            padding: 12px;
        }
        @media (max-width: 600px) {
            form {
                padding: 20px;
            }
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <form action="SignupServlet" method="POST">
        <h2>Create Your Account</h2>
        
        <!-- Display error messages -->
        <%
            String error = request.getParameter("error");
            if (error != null) {
        %>
        <p class="error"><%= error %></p>
        <%
            }
        %>

        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter Username" required />
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter Password" required />
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter Email" required />
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" placeholder="Enter Phone Number" pattern="[0-9]{10}" title="Please enter a valid 10-digit phone number" required />
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <textarea id="address" name="address" placeholder="Enter your address" required></textarea>
        </div>
        <div class="form-group">
            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="" disabled selected>Select Role</option>
                <option value="customer">Customer</option>
                <option value="admin">Admin</option>
                <option value="artisan">Artisan</option>
                <option value="culturalConsultant">Cultural Consultant</option>
            </select>
        </div>
        <input type="submit" value="Sign Up" />
    </form>
</body>
</html>
