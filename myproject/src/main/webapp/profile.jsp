<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <title>Customer Profile</title>
    <style>
        /* General Page Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #333;
            padding: 30px;
            background-color: #3498db;
            margin-bottom: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Profile Container */
        .profile-container {
            width: 90%;
            max-width: 900px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }

        .profile-info {
            padding: 10px;
            font-size: 18px;
        }

        .profile-info span {
            font-weight: bold;
        }

        .back-button {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 30px;
            background-color: #3498db;
            color: white;
            font-size: 16px;
            text-decoration: none;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .back-button:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }
          body {
        text-align: center;
    }
    </style>
</head>

<body>
    <h1>Customer Profile</h1>

    <div class="profile-container">
        <!-- Display customer details -->
        <div class="profile-info">
            <p><span>Customer ID:</span> ${customer.id}</p>
            <p><span>Username:</span> ${customer.username}</p>
            <p><span>Email:</span> ${customer.email}</p>
            <p><span>Phone:</span> ${customer.phone}</p>
            <p><span>Address:</span> ${customer.address}</p>
        </div>
    </div>

    <!-- Back Button -->
    <a href="customer.jsp" class="back-button">Back to Dashboard</a>
</body>

</html>
