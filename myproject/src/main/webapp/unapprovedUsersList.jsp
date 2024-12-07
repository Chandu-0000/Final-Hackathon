<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <title>Unapproved Users List</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #5d5c61;
            padding: 20px;
            background-color: #fff;
            margin-bottom: 30px;
            border-bottom: 2px solid #ccc;
        }

        .table-container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
            text-transform: uppercase;
        }

        td {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .empty-message {
            text-align: center;
            font-size: 18px;
            color: #555;
            margin-top: 20px;
        }

       /* Button container to make buttons side by side */
.button-container {
    display: flex;               /* Align buttons side by side */
    gap: 10px;                   /* Add space between buttons */
    justify-content: center;     /* Optional: center the buttons */
}

.approve-button, .delete-button {
    background-color: #3498db;
    color: white;
    font-size: 14px;
    padding: 8px 16px;
    border-radius: 5px;
    text-decoration: none;
    transition: background-color 0.3s;
    display: inline-block;
    width: auto; /* Ensures button doesn't take full width */
}

.approve-button:hover, .delete-button:hover {
    background-color: #2980b9;
}


        .back-button {
            display: inline-block;
            margin: 30px auto;
            padding: 12px 30px;
            background-color: #3498db;
            color: white;
            font-size: 16px;
            text-decoration: none;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease, transform 0.3s ease;
            width: 200px;
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
    <h1>Unapproved Users List</h1>

    <div class="table-container">
        <!-- Check if there are unapproved users -->
        <c:if test="${not empty unapprovedUsers}">
            <table>
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Loop through the unapproved users and display their details -->
                   <c:forEach var="user" items="${unapprovedUsers}">
    <tr>
        <td>${user.id}</td>
        <td>${user.username}</td>
        <td>${user.email}</td>
        <td>${user.phone}</td>
        <td>${user.address}</td>
        <td>${user.role}</td>
        <td>
            <!-- Buttons container -->
            <div class="button-container">
                <!-- Approve button, passing the user ID to the servlet -->
                <a href="ApproveUserServlet?id=${user.id}" class="approve-button">Approve</a>
                <!-- Delete button, passing the user ID to the servlet -->
                <a href="DeleteUserServlet?id=${user.id}" class="delete-button">Delete</a>
            </div>
        </td>
    </tr>
</c:forEach>

                </tbody>
            </table>
        </c:if>

        <!-- If no unapproved users found -->
        <c:if test="${empty unapprovedUsers}">
            <div class="empty-message">
                <p>No unapproved users found.</p>
            </div>
        </c:if>
    </div>

    <!-- Back Button -->
    <a href="admin.jsp" class="back-button">Back to Dashboard</a>

</body>

</html>
