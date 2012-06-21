<%@page import="ro.gdg.web.model.AuthResponse"%>
<%@page import="json.JSONObject"%>
<%@page import="json.JSONArray"%>
<%@page import="ro.gdg.web.db.DBManager"%>
<%@ page language="java" contentType="application/json; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<%
    System.out.println("Mobile Login request = " + request.toString());
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    PrintWriter pw = response.getWriter();

    if (DBManager.verifyUser(email, password)) {
        System.out.println("Mobile login successful with " + email + " and " + password);

        AuthResponse authResponse = new AuthResponse(AuthResponse.AUTH_STATUS_OK, email);
        JSONObject userJson = new JSONObject(authResponse);
        pw.append(userJson.toString());
    } else {
        response.sendError(403, "Forbidden");
    }

%>   
