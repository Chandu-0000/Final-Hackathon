<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complete Checkout</title>
    <style>
        .checkout-container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        .checkout-container h2 {
            text-align: center;
            color: #4CAF50;
        }
        .checkout-details p {
            font-size: 18px;
        }
        .submit-button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            font-size: 18px;
            cursor: pointer;
        }
        .submit-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="checkout-container">
        <h2>Checkout Details</h2>
        <div class="checkout-details">
            <p><strong>Product Name:</strong> ${param.productName}</p>
            <p><strong>Price:</strong> $${param.productPrice}</p>
            <p><strong>Stock Available:</strong> ${param.productStock}</p>
        </div>

        <!-- Simple Pay Now button -->
        <form id="payment-form" method="POST" action="payment-success.jsp">
            <button id="submit" class="submit-button">Pay Now</button>
        </form>
    </div>
</body>
</html>
