package com.VuProfileVista.model;
import java.util.List;

public class Product {
    private String productName;
    private String image;
    private String entryDate;
    private String status;
    private String country;
    private List<String> colors;

    // Constructors, getters, and setters

    public Product() {
    }

    public Product(String productName, String image, String entryDate, String status, String country, List<String> colors) {
        this.productName = productName;
        this.image = image;
        this.entryDate = entryDate;
        this.status = status;
        this.country = country;
        this.colors = colors;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(String entryDate) {
        this.entryDate = entryDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public List<String> getColors() {
        return colors;
    }

    public void setColors(List<String> colors) {
        this.colors = colors;
    }
}
