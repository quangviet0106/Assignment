/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class OrderDetail {
    private Product product;
    private Order order;
    private double oquantity;
    private double price;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public double getOquantity() {
        return oquantity;
    }

    public void setOquantity(double oquantity) {
        this.oquantity = oquantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
     public double getTotal()
    {
        return oquantity * price;
    }
    
}
