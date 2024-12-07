<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <title>Customer List</title>
    <style>
        /* General Page Styling */
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

        /* Container for the table */
        .table-container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Styling the Table */
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

        /* Hover effects on rows */
        tr:hover {
            background-color: #f1f1f1;
        }

        /* Styling for empty customer message */
        .empty-message {
            text-align: center;
            font-size: 18px;
            color: #555;
            margin-top: 20px;
        }

        /* Styling for the 'No Customers' message */
        .empty-message p {
            font-size: 18px;
            font-weight: 600;
            color: #e74c3c;
        }

        /* Back button styling */
        .back-button {
            display: block;
            width: 150px;
            margin: 30px auto;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-align: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .back-button:hover {
            background-color: #2980b9;
        }

        /* Responsive Design for small screens */
        @media screen and (max-width: 768px) {
            table {
                width: 100%;
            }

            th, td {
                padding: 10px;
            }

            h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>

<body>
    <h1>Customer List</h1>

    <!-- Check if customers list is not empty -->
    <div class="table-container">
        <c:if test="${not empty customers}">
            <table>
                <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>Customer Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Loop through the list of customers and display their details -->
                    <c:forEach var="customer" items="${customers}">
                        <tr>
                            <td>${customer.id}</td>
                            <td>${customer.username}</td>
                            <td>${customer.email}</td>
                            <td>${customer.phone}</td>
                            <td>${customer.address}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- If no customers are found -->
        <c:if test="${empty customers}">
            <div class="empty-message">
                <p>No customers found.</p>
            </div>
        </c:if>
    </div>

    <!-- Back Button -->
    <button class="back-button" onclick="window.location.href='admin.jsp';">Back to Dashboard</button>

</body>

</html>
