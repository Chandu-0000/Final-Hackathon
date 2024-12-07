document.addEventListener("DOMContentLoaded", function () {
    const cartCount = sessionStorage.getItem("cartCount") || 0;
    const cartButton = document.querySelector("a[href='cart.jsp']");
    cartButton.innerHTML = `Cart (${cartCount})`;
});
