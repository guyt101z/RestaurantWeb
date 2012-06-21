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
                                String categoryName = request.getParameter("categName");
                                ArrayList<Category> result = DBManager.getMenu();
                                for (int i = 0; i < result.size() - 1; i++) {
                                    if (categoryName == null && i == 0) {
                                        out.println("<li><a class=\"active\" href=\"menu.jsp?categName=" + result.get(i).getName() + "\">" + result.get(i).getName() + "</a></li>");
                                    } else if (result.get(i).getName().equals(categoryName)) {
                                        out.println("<li><a class=\"active\" href=\"menu.jsp?categName=" + result.get(i).getName() + "\">" + result.get(i).getName() + "</a></li>");
                                    } else {
                                        out.println("<li><a href=\"menu.jsp?categName=" + result.get(i).getName() + "\">" + result.get(i).getName() + "</a></li>");
                                    }
                                }
                                if (categoryName != null && result.get(result.size() - 1).getName().equals(categoryName)) {
                                    out.println("<li><a class=\"active\" class=\"last\" href=\"menu.jsp?categName=" + result.get(result.size() - 1).getName() + "\">" + result.get(result.size() - 1).getName() + "</a></li>");
                                } else {
                                    out.println("<li><a class=\"last\" href=\"menu.jsp?categName=" + result.get(result.size() - 1).getName() + "\">" + result.get(result.size() - 1).getName() + "</a></li>");
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
                            if (categoryName == null) {
                                out.println("<h1>" + result.get(0).getName() + "</h1>");
                                out.println("<ul class=\"prodList\">");
                                for (Product product : result.get(0).getProducts()) {
                                    out.println("<li>");

                                    out.println("<a class=\"prodImg\" href=\"images/sample/prod1.jpg\">");
                                    out.println("<img src=\"images/sample/thumbs/prod1.jpg\" alt=\"product name\" />");
                                    out.println("</a>");

                                    out.println("<h4>" + product.getName() + "</h4>");
                                    out.println("<p>" + product.getPrice() + "  RON</p>");

                                    out.println("<div class=\"clearElement\"></div>");
                                    out.println("</li>");
                                }
                                out.println("</ul>");
                            } else {
                                for (Category category : result) {
                                    if (category.getName().equals(categoryName)) {
                                        out.println("<h1>" + category.getName() + "</h1>");
                                        out.println("<ul class=\"prodList\">");

                                        for (Product product : category.getProducts()) {
                                            out.println("<li>");

                                            out.println("<a class=\"prodImg\" href=\"images/sample/prod1.jpg\">");
                                            out.println("<img src=\"images/sample/thumbs/prod1.jpg\" alt=\"product name\" />");
                                            out.println("</a>");

                                            out.println("<h4>" + product.getName() + "</h4>");
                                            out.println("<p>" + product.getPrice() + "  RON</p>");

                                            out.println("<div class=\"clearElement\"></div>");
                                            out.println("</li>");
                                        }
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