/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ro.gdg.web.model;

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
    
    public TableBill(String waiterEmail, int tableNumber, String date, int status){
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
    
}
