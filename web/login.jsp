<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    String error = request.getParameter("error");
    if (error == null || error == "null") {
        error = "";
    }
%>

<html>
    <head>
        <title>G1 :: Order Management System</title>
        <link rel="stylesheet" href="css/styles.css" type="text/css" media="screen" />
        <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="js/login.js"></script>
        <script>
            function trim(s) 
            {
                return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
            }

            function validate()
            {
                if(trim(document.frmLogin.email.value)=="")
                {
                    document.getElementById("msg").style.visibility="visible";
                    document.getElementById("error").style.visibility="hidden";
                    return false;
                }
                else if(trim(document.frmLogin.pass.value)=="")
                {
                    document.getElementById("msg").style.visibility="visible";
                    document.getElementById("error").style.visibility="hidden";
                    return false;
                }
            }
            
            function resetMsg(){  
                document.getElementById("msg").style.visibility="hidden";  
            }
        </script>
    </head>
    <body>
        <div class="shadow">
            <div class="header">
                <a class="logo"><img src="images/g1-oms.png" alt="G1 Order Management System" /></a>
            </div>
            <div id="msg" style="visibility:hidden; padding-top: 60px" align="center" >  
                <B><Font color="red">Empty fields!</font></b>  
            </div>
            <div id="error" align="center">
                <B><Font color="red"><%=error%></font></b>
            </div>
            <div class="loginBox">
                <h2><img src="images/my-restaurant-logo.png" alt="My Restaurant" /></h2>
                <form name="frmLogin" onSubmit="return validate();" action="doLogin.jsp" method="post">
                    <fieldset>
                        <ul class="formFields">
                            <li>
                                <label for="email">E-mail address</label>
                                <input id="email" name="email" type="text" onFocus="resetMsg()"/>
                            </li>
                            <li>
                                <label for="pass">Password</label>
                                <input id="pass" name="pass" type="password" onFocus="resetMsg()"/>
                            </li>
                            <li>
                                <input type="submit" value="Log in" />
                            </li>

                        </ul>
                    </fieldset>
                </form>
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
