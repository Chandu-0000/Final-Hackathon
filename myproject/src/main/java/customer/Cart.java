package customer;
import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<Product> products = new ArrayList<>();

    // Add product to the cart
    public void addProduct(Product product) {
        products.add(product);
    }

    // Get all products in the cart
    public List<Product> getProducts() {
        return products;
    }

    // Calculate the total price of all products in the cart
    public double getTotal() {
        double total = 0;
        for (Product product : products) {
            total += product.getPrice();
        }
        return total;
    }

    // Check if the cart is empty
    public boolean isEmpty() {
        return products.isEmpty();
    }
}
