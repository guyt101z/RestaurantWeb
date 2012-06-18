<%-- 
    Document   : index
    Created on : Jun 14, 2012, 10:16:05 AM
    Author     : diana
--%>
<%@page import="ro.gdg.web.model.Category"%>
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

    System.out.println("Menu request = " + request.toString());
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    PrintWriter pw = response.getWriter();

    if (DBManager.verifyUser(email, password)) {
        System.out.println("verify user successful with " + email + " and " + password);
        ArrayList<Category> categories = DBManager.getMenu();
        System.out.println("Menu from db " + categories);
        
        JSONArray categorys = new JSONArray();
        JSONObject categoryJson;
        for (Category category : categories) {
            categoryJson = new JSONObject(category);
            categorys.put(categoryJson);
        }
        pw.append("{ categories : [");
        for (int i = 0; i < categorys.length(); i++) {
            pw.append(categorys.get(i) + ", ");
        }
        pw.append("] }");
    } else {
        response.sendError(403, "Forbidden");
    }
%>   
