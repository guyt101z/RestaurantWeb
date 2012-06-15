<%-- 
    Document   : index
    Created on : Jun 14, 2012, 10:16:05 AM
    Author     : diana
--%>
<%@page import="ro.gdg.web.model.AuthResponse"%>
<%@page import="json.JSONObject"%>
<%@page import="json.JSONArray"%>
<%@page import="ro.gdg.web.db.DBManager"%>
<%@ page language="java" contentType="application/json; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<%
    System.out.println("Login request = " + request.toString());
    String email = request.getParameter("email");
    Long timestamp = Long.getLong(request.getParameter("timestamp"));
    String signature = request.getParameter("signature");
    
    String data = timestamp + ":" + email;
    String password = request.getParameter("password");
    PrintWriter pw = response.getWriter();
    
    String dbUsername = "", dbPassword = "", type = "";
    ArrayList<HashMap> result = DBManager.executeQuery("Select * from users where email='" + email + "'");
    if (result.size() == 1) {
        dbUsername = result.get(0).get("email") + "";
        dbPassword = result.get(0).get("password") + "";
        type = result.get(0).get("type") + "";
        if (email.equalsIgnoreCase(dbUsername) && password.equalsIgnoreCase(dbPassword)) {
            System.out.println("login successful with " + email + " and " + password);
            
            AuthResponse authResponse = new AuthResponse(AuthResponse.AUTH_STATUS_OK, email);
            JSONObject userJson = new JSONObject(authResponse);
            pw.append(userJson.toString());          
        } else {
            response.sendError(403, "Forbidden");
        }
    } else {
        response.sendError(403, "Forbidden");
    }
%>   
