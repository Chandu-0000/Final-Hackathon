<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
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
        .checkout-container p {
            font-size: 18px;
        }
        .checkout-details {
            margin: 10px 0;
        }
        .checkout-details strong {
            font-weight: bold;
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
        
        <!-- Display the product details passed from the previous page -->
        <div class="checkout-details">
            <p><strong>Product Name:</strong> ${param.productName}</p>
            <p><strong>Price:</strong> $${param.productPrice}</p>
            <p><strong>Stock Available:</strong> ${param.productStock}</p>
        </div>

        <!-- Form to submit order for completion -->
        <form action="completeCheckout.jsp" method="POST">
            <!-- Hidden fields to send the product information -->
            <input type="hidden" name="productId" value="${param.productId}">
            <input type="hidden" name="productName" value="${param.productName}">
            <input type="hidden" name="productPrice" value="${param.productPrice}">
            <input type="hidden" name="productStock" value="${param.productStock}">
            
            <!-- Add other necessary customer details here -->
            <div class="checkout-details">
                <label for="customerName"><strong>Your Name:</strong></label>
                <input type="text" id="customerName" name="customerName" required placeholder="Enter your name" class="form-input">
            </div>
            
            <div class="checkout-details">
                <label for="customerAddress"><strong>Your Address:</strong></label>
                <textarea id="customerAddress" name="customerAddress" required placeholder="Enter your address" class="form-input"></textarea>
            </div>
            
            <div class="checkout-details">
                <label for="customerEmail"><strong>Your Email:</strong></label>
                <input type="email" id="customerEmail" name="customerEmail" required placeholder="Enter your email" class="form-input">
            </div>

            <!-- Submit the order -->
            <button type="submit" class="submit-button">Complete Checkout</button>
        </form>
    </div>
</body>
</html>
