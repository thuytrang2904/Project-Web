<%-- 
    Document   : editRoom
    Created on : Dec 9, 2019, 2:08:26 PM
    Author     : ASUS
--%>

<%@page import="trangbtt.dtos.RoomDTO"%>
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
        <h1 style="text-align: center; margin-top: 40px;" >Update Room Type!</h1>
        <%
            RoomDTO dto = (RoomDTO) request.getAttribute("DTO");
        %>

        <div class="container table-responsive py-5">
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">No</th>
                        <th scope="col">Room Number</th>
                        <th scope="col">Room Type</th>
                        <th scope="col">Price</th>
                        <th scope="col">Max Person</th>
                        <th scope="col">Status</th>
                        <th scope="col">Update</th>




                    </tr>
                </thead>


                 <tbody>

                    <tr>
                <form action="UpdateRoomController" method="POST">
                    <td>#</td>
                    <td><input type="text" name="id" value="<%= dto.getRoomID()%>" readonly="true"/></td>
                    <td><input type="text" name="txtType" value="<%= dto.getRoomType()%>" /></td>
                    <td><input type="text" name="txtPrice" value="<%= dto.getPrice()%>" /></td>
                    <td> <input type="text" name="txtMax" value="<%= dto.getMaxPerson()%>" /></td>

                    <td>
                        <select name="txtStatus">
                            <option <% if (dto.getStatus().equals("Active")) { %> selected="true"<% } %> >Active</option>
                            <option <% if (dto.getStatus().equals("UnActive")) { %> selected="true"<% }%>>UnActive</option>
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
