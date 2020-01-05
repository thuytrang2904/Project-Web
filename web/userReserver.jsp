<%-- 
    Document   : userReserver
    Created on : Dec 5, 2019, 3:15:51 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <c:if test="${sessionScope.ROLE ne 'user'}">
            <jsp:forward page="index.jsp" />
        </c:if>
       <%@include file="userHeader.jsp" %>
        <%@include file="userMain.jsp" %>
        <%@include file="userFootter.jsp" %>
    </body>
</html>
