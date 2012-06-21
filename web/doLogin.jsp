<%@page import="ro.gdg.web.model.AuthResponse"%>
<%@page import="json.JSONObject"%>
<%@page import="json.JSONArray"%>
<%@page import="ro.gdg.web.db.DBManager"%>
<%@ page language="java" contentType="application/json; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<%
    System.out.println("Web Login request = " + request.toString());
    String email = request.getParameter("email");
    String password = request.getParameter("pass");

    if (DBManager.verifyUser(email, password)) {
        System.out.println("Web login successful with " + email + " and " + password);

        String type = DBManager.getType(email);
        if (type.equals("manager")) {
            session.setAttribute("UserName", email);
            response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server  
            response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance  
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"  
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility  
            response.sendRedirect("menu.jsp");
        } else if (type.equals("cook")) {
            session.setAttribute("UserName", email);
            response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server  
            response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance  
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"  
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility  
            response.sendRedirect("tables.jsp");
        } else {
            response.sendRedirect("login.jsp?error=You don't have permissions to login on the web application!");
        }
    } else {
        response.sendRedirect("login.jsp?error=Invalid login!");
    }
%>