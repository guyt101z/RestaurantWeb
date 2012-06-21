<%@page import="ro.gdg.web.model.User"%>
<%@page import="ro.gdg.web.model.Product"%>
<%@page import="ro.gdg.web.model.Category"%>
<%@page import="ro.gdg.web.db.DBManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>G1 :: Order Management System</title>
        <link rel="stylesheet" href="css/styles.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
        <link href='http://fonts.googleapis.com/css?family=Belleza' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    </head>
    <body>
        <div class="shadow">
            <div class="header">
                <div class="wrapper">
                    <ul class="menu left">
                        <li class="elem"><a href="menu.jsp">Menu</a></li>
                        <li class="clearElement">&nbsp;</li>
                    </ul>
                    <ul class="menu right">
                        <li class="elem"><a href="users.jsp">Users</a></li>
                        <li class="elem"><a href="doLogout.jsp">Log out</a></li>
                        <li class="clearElement">&nbsp;</li>
                    </ul>
                    <a class="logo"><img src="images/g1-oms.png" alt="G1 Order Management System" /></a>
                    <div class="clearElement"></div>
                </div>
            </div>
            <div class="content">
                <div class="leftBox">
                    <div class="boxTop"></div>
                    <div class="boxContent">
                        <ul class="menuCategs">
                            <%
                                String userName = request.getParameter("userName");
                                ArrayList<User> result = DBManager.getUsers();
                                for (int i = 0; i < result.size() - 1; i++) {
                                    if (userName == null && i == 0) {
                                        out.println("<li><a class=\"active\" href=\"users.jsp?userName=" + result.get(i).getFullName() + "\">" + result.get(i).getFullName() + "</a></li>");
                                    } else if (result.get(i).getFullName().equals(userName)) {
                                        out.println("<li><a class=\"active\" href=\"users.jsp?userName=" + result.get(i).getFullName() + "\">" + result.get(i).getFullName() + "</a></li>");
                                    } else {
                                        out.println("<li><a href=\"users.jsp?userName=" + result.get(i).getFullName() + "\">" + result.get(i).getFullName() + "</a></li>");
                                    }
                                }
                                if (userName != null && result.get(result.size() - 1).getFullName().equals(userName)) {
                                    out.println("<li><a class=\"active\" class=\"last\" href=\"users.jsp?userName=" + result.get(result.size() - 1).getFullName() + "\">" + result.get(result.size() - 1).getFullName() + "</a></li>");
                                } else {
                                    out.println("<li><a class=\"last\" href=\"users.jsp?userName=" + result.get(result.size() - 1).getFullName() + "\">" + result.get(result.size() - 1).getFullName() + "</a></li>");
                                }
                            %>
                        </ul>
                    </div>
                    <div class="boxBottom"></div>
                </div>
                <div class="varContent">
                    <div class="top"></div>
                    <div class="center">
                        <%
                            if (userName == null) {
                                out.println("<h1>" + result.get(0).getFullName() + "</h1>");
                                out.println("<ul class=\"prodList\">");
                                out.println("<li>");

                                out.println("<a class=\"prodImg\" href=\"images/sample/thumbs/prod2.jpg\">");
                                out.println("<img src=\"images/sample/thumbs/prod2.jpg\" alt=\"user name\" />");
                                out.println("</a>");

                                out.println("<p>" + result.get(0).getEmail() + "</p>");
                                out.println("<h4>" + result.get(0).getType() + "</h4>");

                                out.println("<div class=\"clearElement\"></div>");
                                out.println("</li>");

                                out.println("</ul>");
                            } else {
                                for (User user : result) {
                                    if (user.getFullName().equals(userName)) {
                                        out.println("<h1>" + user.getFullName() + "</h1>");
                                        out.println("<ul class=\"prodList\">");
                                        out.println("<li>");

                                        out.println("<a class=\"prodImg\" href=\"images/sample/thumbs/prod2.jpg\">");
                                        out.println("<img src=\"images/sample/thumbs/prod2.jpg\" alt=\"user name\" />");
                                        out.println("</a>");

                                        out.println("<p>" + user.getEmail() + "</p>");
                                        out.println("<h4>" + user.getType() + "</h4>");

                                        out.println("<div class=\"clearElement\"></div>");
                                        out.println("</li>");

                                        out.println("</ul>");
                                        break;
                                    }
                                }
                            }

                        %>

                        <script type="text/javascript">
                            $(function(){
                                $('a.prodImg').fancybox();
                            });
                        </script>
                    </div>
                    <div class="bottom"></div>
                </div>
                <div class="clearElement"></div>
            </div>
        </div>
        <div class="bottomBar">
            <div class="appName"><img src="images/g1-mini.png" alt="G1 Order Management System" /></div>
            <div class="copyright">
                Copyright &copy; 2012 <a href="mailto:ghele_diana@yahoo.com">Ghele Diana</a><br />
                UBB, Facultatea Mate-Info, specializare Info-Eng.
            </div>
            <div class="clearElement"></div>
        </div>
    </body>
</html>