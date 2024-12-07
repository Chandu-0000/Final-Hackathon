document.getElementById("pay-now").addEventListener("click", function(event) {
    event.preventDefault();

    // Simulate successful payment (You can replace this with actual payment gateway logic)
    setTimeout(function() {
        // Simulate the successful payment
        window.location.href = "payment-success.jsp";  // Redirect to payment success page

        // Remove the items from the cart
        fetch("removeItemsFromCart", {
            method: "POST",
            body: JSON.stringify({
                // Send the cart details (or cart items IDs)
                cartItems: ["product_id1", "product_id2", "product_id3"]  // This should be dynamic
            }),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(response => {
            if (response.ok) {
                console.log("Items removed from the cart");
            }
        });
    }, 1000);  // Simulate a delay (you can replace this with actual payment logic)
});
