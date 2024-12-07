<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <title>Artisan List</title>
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

        /* Table Container */
        .table-container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            margin-top: 20px;
        }

        th,
        td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: white;
            font-weight: bold;
        }

        td {
            background-color: #fafafa;
        }

        tr:hover td {
            background-color: #f1f1f1;
        }

        /* No Customers Message */
        .empty-message {
            text-align: center;
            font-size: 18px;
            color: #e74c3c;
            margin-top: 20px;
        }

        .empty-message p {
            font-weight: bold;
        }

        /* Back Button Styling */
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

        /* Responsive Design */
        @media screen and (max-width: 768px) {
            table {
                width: 100%;
            }

            th,
            td {
                padding: 10px;
            }

            h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>

<body>
    <h1>Artisan List</h1>

    <!-- Table Container -->
    <div class="table-container">
        <!-- Check if customers list is not empty -->
        <c:if test="${not empty customers}">
            <table>
                <thead>
                    <tr>
                        <th>Artisan ID</th>
                        <th>Artisan Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Loop through the list of artisans and display their details -->
                    <c:forEach var="artisan" items="${customers}">
                        <tr>
                            <td>${artisan.id}</td>
                            <td>${artisan.username}</td>
                            <td>${artisan.email}</td>
                            <td>${artisan.phone}</td>
                            <td>${artisan.address}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- If no artisans are found -->
        <c:if test="${empty customers}">
            <div class="empty-message">
                <p>No artisans found.</p>
            </div>
        </c:if>
    </div>

    <!-- Back Button -->
    <a href="admin.jsp" class="back-button">Back to Dashboard</a>

</body>

</html>
