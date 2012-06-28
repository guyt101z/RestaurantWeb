<%-- 
    Document   : index
    Created on : Jun 14, 2012, 10:16:05 AM
    Author     : diana
--%>
<%@page import="ro.gdg.web.model.OrderedProduct"%>
<%@page import="ro.gdg.web.model.TableBill"%>
<%@page import="ro.gdg.web.model.AuthResponse"%>
<%@page import="json.JSONObject"%>
<%@page import="json.JSONArray"%>
<%@page import="ro.gdg.web.db.DBManager"%>
<%@ page language="java" contentType="application/json; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<%

    System.out.println("Table bills request = " + request.toString());
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    PrintWriter pw = response.getWriter();

    if (DBManager.verifyUser(email, password)) {
        System.out.println("verify user successful with " + email + " and " + password);
        ArrayList<TableBill> tableBills = DBManager.getTableBillsFromLast24H();
        System.out.println("Table bills from db " + tableBills);

        JSONArray bills = new JSONArray();
        JSONObject billJson;
        for (TableBill bill : tableBills) {
            billJson = new JSONObject(bill);
            if (bill.getProducts() != null) {
                JSONArray prodsJSON = new JSONArray();
                JSONArray products = new JSONArray();
                for (OrderedProduct product : bill.getProducts()) {
                    products.put(new JSONObject(product));
                }
                prodsJSON.put(products);
            }
            System.out.println("billJson = " + billJson.toString());
            bills.put(billJson);
        }
        pw.append("{ tBills : [");
        for (int i = 0; i < bills.length(); i++) {
            pw.append(bills.get(i) + ", ");
        }
        pw.append("] }");
    } else {
        response.sendError(403, "Forbidden");
    }
%>   
