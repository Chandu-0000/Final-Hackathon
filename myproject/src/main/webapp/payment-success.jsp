<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .success-container {
            text-align: center;
            padding: 50px;
            background-color: white;
            margin: 50px auto;
            width: 50%;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        .success-message {
            color: green;
            font-size: 28px;
            font-weight: bold;
        }
        .success-description {
            font-size: 18px;
            margin-top: 10px;
        }
        .success-button {
            display: inline-block;
            padding: 12px 25px;
            background-color: #4CAF50;
            color: white;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            margin-top: 30px;
        }
        .success-button:hover {
            background-color: #45a049;
        }
        .success-button:active {
            background-color: #3e8e41;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <div class="success-message">
            <h2>Payment Successful!</h2>
        </div>
        <div class="success-description">
            <p>Your payment has been successfully processed. Thank you for your purchase!</p>
        </div>
        <a href="customer.jsp" class="success-button">Go to Home</a>
    </div>
</body>
</html>
