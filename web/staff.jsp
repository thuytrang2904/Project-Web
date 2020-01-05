
<%@page import="trangbtt.daos.BookingDAO"%>
<%@page import="trangbtt.dtos.BookingDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/sr.css" type="text/css">
    </head>

    <body>
        <c:if test="${sessionScope.ROLE ne 'staff'}">
            <jsp:forward page="index.jsp"/>
        </c:if>

        <form action="SearchStaffController" method="POST" class="searchS" style="padding-left:200px; padding-right: 200px; ">
            <input type="text" name="txtSearch" class="form-control"  placeholder="Phone">
            <input type="submit" value="SEARCH" class="buttonS">
        </form>

        <div style="padding: 50px 50px 0 50px;">
            <%
                List<BookingDTO> result = (List<BookingDTO>) request.getAttribute("INFO");
                if (result != null) {
                    if (result.size() > 0) {
            %>

            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Fullname</th>
                        <th scope="col">From</th>
                        <th scope="col">To</th>
                        <th scope="col">Room Number</th>
                        <th scope="col">Adults</th>
                        <th scope="col">Children</th>
                        <th scope="col">Check In</th>
                        <th scope="col">Check out</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 0;
                        for (BookingDTO dto : result) {
                            count++;

                    %>
                    <tr>

                        <td><%= count%></td>
                        <td><input type="text" name="Phone" readonly="true" value="<%= dto.getPhone()%>"/>


                        </td>
                        <td><%= dto.getName()%></td>
                        <td><%= dto.getFrom()%></td>
                        <td><%= dto.getTo()%></td>
                        <td><%= dto.getRoomID()%></td>
                        <td><%= dto.getAdult()%></td>
                        <td><%= dto.getChild()%></td>
                        <td>   
                            <form action="UpdateCheckInController" method="POST">
                                <input type="hidden" name="roomID"  value="<%= dto.getRoomID()%>"/>
                                <input  type="submit" name="cbIn" onclick="check()" value="Check"/>
                            </form>
                        </td>
                        <td> 
                            <form action="UpdateCheckOutController" method="POST">
                                <input type="hidden" name="roomID"  value="<%= dto.getRoomID()%>"/>

                                <input  type="submit" name="cbOut" onclick="check()" value="Check"/>
                            </form>
                        </td> 





                    </tr>
                    <%
                        }
                    %>

                </tbody>


            </table>
            <% } else {

            %>
            <font color="red">No record found</font>

            <%            }
                }
            %>
            <div style="padding: 50px 50px 0 50px;">

                <table class="table table-bordered table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Fullname</th>
                            <th scope="col">From</th>
                            <th scope="col">To</th>
                            <th scope="col">Room Number</th>
                            <th scope="col">Adults</th>
                            <th scope="col">Children</th>
                            <th scope="col">Check In</th>
                            <th scope="col">Check out</th>
                        </tr>
                    </thead>
                    <%
                        BookingDAO dao = new BookingDAO();
                        List<BookingDTO> resultL = dao.loadAll();
                        if (resultL != null) {
                            if (resultL.size() > 0) {
                    %>
                    <tbody>
                        <%
                            int count = 0;
                            for (BookingDTO dtos : resultL) {
                                count++;
                        %>
                        <tr>

                            <td><%= count%></td>
                            <td><input type="text" name="Phone" readonly="true" value="<%= dtos.getPhone()%>"/>


                            </td>
                            <td><%= dtos.getName()%></td>
                            <td><%= dtos.getFrom()%></td>
                            <td><%= dtos.getTo()%></td>
                            <td><%= dtos.getRoomID()%></td>
                            <td><%= dtos.getAdult()%></td>
                            <td><%= dtos.getChild()%></td>
                            <td>  
                                <input  type="checkbox"  id="myCheck"  <% if (dtos.isIn() == true) { %>checked="checked"<%}%>/>
                            </td>
                            <td> 
                                <input  type="checkbox"  id="myCheck"  <% if (dtos.isOut() == true) { %>checked="checked"<%}%>/>
                            </td> 





                            <%
                                }
                            %>
                        </tr>


                    </tbody>
                    <% } else {

                    %>
                    <font color="red">No record found</font>

                    <%            }
                        }
                    %>

                </table>

            </div>

            <div style="display: flex; flex-flow: row wrap; justify-content: flex-end; padding-right: 50px;" >
                <form action="BillController" method="POST" class="updateTT">


                    <input type="submit" value="Bill" class="bill" style="width:130px;" >
                </form>
                <form action="LogoutController" method="POST" class="updateTT">
                    <input type="submit" value="LOG OUT" style="width:130px;" /> 
                </form>
            </div>
            <script>
                function check() {
                    document.getElementById("myCheck").checked = true;
                }


            </script>

    </body>

</html>