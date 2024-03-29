/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ro.gdg.web.db;

import java.util.ArrayList;
import java.util.HashMap;
import ro.gdg.web.model.Category;
import ro.gdg.web.model.OrderedProduct;
import ro.gdg.web.model.Product;
import ro.gdg.web.model.TableBill;
import ro.gdg.web.model.User;

/**
 *
 * @author diana
 */
public class DBManager {

    public static boolean verifyUser(String email, String password) {
        String dbUsername = "", dbPassword = "", type = "";
        ArrayList<HashMap> result = DBUtil.executeQuery("Select * from users where email='" + email + "'");
        if (result.size() == 1) {
            dbUsername = result.get(0).get("email") + "";
            dbPassword = result.get(0).get("password") + "";
            type = result.get(0).get("type") + "";
            if (email.equalsIgnoreCase(dbUsername) && password.equalsIgnoreCase(dbPassword)) {
                System.out.println("login successful with " + email + " and " + password);
                return true;
            }
        }
        return false;
    }

    public static String getType(String userEmail) {
        ArrayList<HashMap> result = DBUtil.executeQuery("Select * from users where email='" + userEmail + "'");
        if (result.size() == 1) {
            return result.get(0).get("type") + "";
        }
        return ""; //TODO or null
    }

    public static ArrayList<TableBill> getTableBillsFromLast24H() {
        ArrayList<TableBill> bills = new ArrayList<TableBill>();
        TableBill bill;
        ArrayList<HashMap> results = DBUtil.executeQuery("Select * from table_bill where date between DATE_SUB(NOW(),INTERVAL 1 DAY) and NOW()");
        for (int i = 0; i < results.size(); i++) {
            bill = new TableBill(results.get(i).get("waiter_email") + "",
                    Integer.parseInt(results.get(i).get("table_number") + ""),
                    results.get(i).get("date") + "",
                    Integer.parseInt(results.get(i).get("status") + ""));
            System.out.println("Bill id= " + results.get(i).get("id"));
            ArrayList<HashMap> results2 = DBUtil.executeQuery("Select * from product_ordered where table_bill_id=" + results.get(i).get("id"));
            OrderedProduct orderedProduct;
            for (i = 0; i < results2.size(); i++) {
                orderedProduct = new OrderedProduct(Long.parseLong(results2.get(i).get("table_bill_id") + ""),
                        Long.parseLong(results2.get(i).get("product_id") + ""),
                        Integer.parseInt(results2.get(i).get("state_id") + ""),
                        results2.get(i).get("extra_info") + "");
                bill.add(orderedProduct);
                System.out.println("Bill = " + orderedProduct.toString());
            }

            bills.add(bill);
        }
        return bills;
    }

    public static ArrayList<Category> getMenu() {
        ArrayList<Category> categories = new ArrayList<Category>();
        Category category;
        ArrayList<HashMap> results = DBUtil.executeQuery("Select * from category");
        for (int i = 0; i < results.size(); i++) {
            category = new Category(results.get(i).get("name") + "");
            ArrayList<HashMap> results2 = DBUtil.executeQuery("Select * from product where category_id=" + results.get(i).get("id") + "");
            Product product;
            Product[] products = new Product[results2.size()];
            for (int j = 0; j < results2.size(); j++) {
                product = new Product(results2.get(j).get("name") + "",
                        Integer.parseInt(results2.get(j).get("category_id") + ""),
                        Integer.parseInt(results2.get(j).get("price") + ""));
                products[j] = product;
            }
            category.setProducts(products);
            categories.add(category);
        }
        return categories;
    }

    public static ArrayList<User> getUsers() {
        ArrayList<User> users = new ArrayList<User>();
        User user;
        ArrayList<HashMap> results = DBUtil.executeQuery("Select * from users");
        for (int i = 0; i < results.size(); i++) {
            user = new User(results.get(i).get("email") + "",
                    results.get(i).get("name") + "",
                    results.get(i).get("type") + "");
            users.add(user);
        }
        return users;
    }
}
