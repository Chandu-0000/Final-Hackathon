package customer;

public class Product {
    private int id;
    private String name;
    private double price;
    private String imageUrl;  // Optional: If you're dealing with images

    // Constructor that accepts id, name, and price
    public Product(int id, String name, double price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }

    // Getters for each attribute
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    // Optional: If you are handling images
    public String getImageUrl() {
        return imageUrl;
    }

    // Optional: Setters if you need to modify the fields later
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
