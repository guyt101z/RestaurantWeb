/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ro.gdg.web.model;

import java.util.ArrayList;

/**
 *
 * @author diana
 */
public class TableBill {

    public static final int STATUS_OPEN = 0;
    public static final int STATUS_CLOSED = 1;
    
    private String waiterEmail;
    private int tableNumber;
    private String date;
    private int status;
    private OrderedProduct[] products;

    public TableBill(String waiterEmail, int tableNumber, String date, int status) {
        this.waiterEmail = waiterEmail;
        this.tableNumber = tableNumber;
        this.date = date;
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getTableNumber() {
        return tableNumber;
    }

    public void setTableNumber(int tableNumber) {
        this.tableNumber = tableNumber;
    }

    public String getWaiterEmail() {
        return waiterEmail;
    }

    public void setWaiterEmail(String waiterEmail) {
        this.waiterEmail = waiterEmail;
    }

    public OrderedProduct[] getProducts() {
        return products;
    }

    public void setProducts(OrderedProduct[] products) {
        this.products = products;
    }

    public void add(OrderedProduct product) {
        if (null == products){
            products = new OrderedProduct[1];
        } else {
            products = new OrderedProduct[products.length];
        }
        products[products.length-1] = product;
    }
}
