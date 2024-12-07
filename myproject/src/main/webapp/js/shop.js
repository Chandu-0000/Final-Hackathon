document.addEventListener("DOMContentLoaded", function () {
    // Load products into the grid
    fetch("managecustomerProducts")
        .then(response => response.text())
        .then(data => {
            document.getElementById("product-grid").innerHTML = data;
        })
        .catch(error => console.error("Error loading products:", error));

    // Handle Add to Cart button click
    document.body.addEventListener("click", function (e) {
        if (e.target.classList.contains("add-to-cart")) {
            const productId = e.target.getAttribute("data-id");
            const productName = e.target.getAttribute("data-name");
            const productPrice = e.target.getAttribute("data-price");

            // Send the product data to the server to store in the database
            fetch("addToCart", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    productId: productId,
                    productName: productName,
                    productPrice: productPrice
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert(`${productName} added to your cart!`);
                    // Update cart count in sessionStorage
                    let cartCount = data.cartCount;
                    sessionStorage.setItem("cartCount", cartCount);

                    // Update cart count in the button
                    const cartButton = document.querySelector("a[href='cart.jsp']");
                    cartButton.innerHTML = `Cart (${cartCount})`;
                } else {
                    alert("Failed to add to cart. Please try again.");
                }
            })
            .catch(error => console.error("Error adding to cart:", error));
        }
    });
});
