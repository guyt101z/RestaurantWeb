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
        <script type="text/javascript" src="js/dom-drag.js"></script>
    </head>
    <body>
        <div class="shadow">
            <div class="header">
                <div class="wrapper">
                    <ul class="menu left">
                        <li class="elem"><a href="javascript:void(0);">Refresh</a></li>
                        <li class="clearElement">&nbsp;</li>
                    </ul>
                    <ul class="menu right">
                        <li class="elem"><a href="doLogout.jsp">Log out</a></li>
                        <li class="clearElement">&nbsp;</li>
                    </ul>
                    <a class="logo"><img src="images/g1-oms.png" alt="G1 Order Management System" /></a>
                    <div class="clearElement"></div>
                </div>
            </div>
            <ul class="tables">
                <li class="elem">
                    <a class="table" href="javascript:void(0);">1</a>
                    <div class="orderWrapper" id="table1" style="left: 110px; top: 20px;">
                        <div class="orderBox">
                            <div class="boxTitle" id="title1">
                                <div class="tableName">Table 1</div>
                                <div class="waiterName">Ghele Diana</div>
                                <div class="clearElement"></div>
                            </div>
                            <ul class="orderList">
                                <li>
                                    <div class="prod">Cartofi aurii</div>
                                </li>
                                <li>
                                    <div class="prod">Ciorba de burta Baisoara</div>
                                    <p class="notes">cu ardei iute, paine si smantana</p>
                                </li>
                                <li>
                                    <div class="prod">Pizza Vegetariana</div>
                                    <p class="notes">fara masline</p>
                                </li>
                            </ul>
                            <a class="close" href="javascript:void(0);">Close</a>
                            <div class="clearElement"></div>
                        </div>
                    </div>
                </li>
                
                <li class="elem">
                    <a class="table" href="javascript:void(0);">2</a>
                    <div class="orderWrapper" id="table2" style="left: 110px; top: 20px;">
                        <div class="orderBox">
                            <div class="boxTitle" id="title2">
                                <div class="tableName">Table 2</div>
                                <div class="waiterName">Barbu Ruxandra</div>
                                <div class="clearElement"></div>
                            </div>
                            <ul class="orderList">
                                <li>
                                    <div class="prod">Platou rustic Pentathlon</div>
                                </li>
                                <li>
                                    <div class="prod ready">Pizza Prosciuto e funghi</div>
                                    <p class="notes">cu porumb</p>
                                </li>
                                <li>
                                    <div class="prod">Aripioare Red Card</div>
                                </li>
                                <li>
                                    <div class="prod ready">Cartofi prajiti</div>
                                </li>
                            </ul>
                            <a class="close" href="javascript:void(0);">Close</a>
                            <div class="clearElement"></div>
                        </div>
                    </div>
                </li>
                <li class="elem last"><a class="table inactive" href="javascript:void(0);">3</a></li>
                <li class="elem"><a class="table inactive" href="javascript:void(0);">4</a></li>
                <li class="elem"><a class="table inactive" href="javascript:void(0);">5</a></li>
                <li class="elem last"><a class="table" href="javascript:void(0);">6</a></li>
                <li class="elem"><a class="table inactive" href="javascript:void(0);">7</a></li>
                <li class="elem"><a class="table" href="javascript:void(0);">8</a></li>
                <li class="elem last"><a class="table inactive" href="javascript:void(0);">9</a></li>
                <li class="clearElement">&nbsp;</li>
            </ul>
            <script type="text/javascript" src="js/tables.js"></script>
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