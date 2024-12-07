<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <title>Cultural Consultants List</title>
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
    <h1>Cultural Consultants List</h1>

    <div class="table-container">
        <!-- Check if cultural consultants list is not empty -->
        <c:if test="${not empty culturalConsultants}">
            <table>
                <thead>
                    <tr>
                        <th>Consultant ID</th>
                        <th>Consultant Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Loop through the list of cultural consultants and display their details -->
                    <c:forEach var="culturalConsultant" items="${culturalConsultants}">
                        <tr>
                            <td>${culturalConsultant.id}</td>
                            <td>${culturalConsultant.username}</td>
                            <td>${culturalConsultant.email}</td>
                            <td>${culturalConsultant.phone}</td>
                            <td>${culturalConsultant.address}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- If no cultural consultants are found -->
        <c:if test="${empty culturalConsultants}">
            <div class="empty-message">
                <p>No cultural consultants found.</p>
            </div>
        </c:if>
    </div>

    <!-- Back Button -->
    <a href="admin.jsp" class="back-button">Back to Dashboard</a>

</body>

</html>
