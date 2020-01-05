<%-- 
    Document   : update
    Created on : Nov 23, 2019, 9:02:49 AM
    Author     : ASUS
--%>

<%@page import="trangbtt.dtos.SignInDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/sr.css" type="text/css">
    </head>
    <body>
        <c:if test="${sessionScope.ROLE ne 'admin'}">
            <jsp:forward page="index.jsp" />
        </c:if>
        <h1 style="text-align: center; margin-top: 40px;">Update Account</h1>
        <%
            SignInDTO dto = (SignInDTO) request.getAttribute("DTO");
        %>

        <div class="container table-responsive py-5">
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Password</th>
                        <th scope="col">Fullname</th>
                        <th scope="col">Role</th>
                        <th scope="col">Update</th>




                    </tr>
                </thead>


                <tbody>

                    <tr>
                <form action="UpdateController" method="POST">
                    <td>#</td>
                    <td><input type="text" name="id" value="<%= dto.getPhone()%>" readonly="true"/></td>
                    <td><input type="text" name="txtPassword" value="<%= dto.getPassword()%>" /></td>
                    <td> <input type="text" name="txtFullname" value="<%= dto.getFullname()%>" /></td>

                    <td>
                        <select name="cboRole">
                            <option <% if (dto.getRole().equals("admin")) { %> selected="true"<% } %> >admin</option>
                            <option <% if (dto.getRole().equals("staff")) { %> selected="true"<% }%>>staff</option>
                        </select> <br/>

                    </td>
                    <td><input type="submit" value="Update"/></td>
                    
                </form>
                </tr>

                </tbody>

            </table>
        </div>

    </body>
</html>
