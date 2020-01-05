<%-- 
    Document   : error
    Created on : Nov 27, 2019, 10:29:29 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
            String error = (String) request.getAttribute("ERROR");
        %>
        <h2><font color="red"> <%= error %> </font></h2></br>
    </body>
</html>
