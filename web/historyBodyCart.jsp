<%-- 
    Document   : historyBodyCart
    Created on : Dec 14, 2019, 2:43:52 PM
    Author     : ASUS
--%>

<%@page import="trangbtt.dtos.BillDTO"%>
<%@page import="java.util.List"%>
<%@page import="trangbtt.daos.BillDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Main -->
        <h3 id="itemCart">Histoty</h3>

        <div class="viewMainCard">

            <div id="page-content-wrapper">
                <div class="container-fluid xyz">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="container table-responsive py-5">
                                <table class="table table-bordered table-hover" border="0">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">No</th>
                                            <th scope="col">Fullname</th>
                                            <th scope="col">From</th>
                                            <th scope="col">To</th>
                                            <th scope="col">Adult</th>
                                            <th scope="col">Childrent</th>
                                            <th scope="col">Room Number</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Pay Time</th>
                                        </tr>
                                    </thead>
                                    <%
                                        BillDAO dao = new BillDAO();
                                        List<BillDTO> result = dao.loadHistoryCart((String) session.getAttribute("PHONE"));
                                        if (result != null) {
                                            int count = 0;
                                            for (BillDTO dto : result) {
                                                count++;
                                    %>
                                    <tbody>

                                        <tr>

                                            <td> <%= count%></td>
                                            <td><%= dto.getName()%></td>
                                            <td><%= dto.getFrom()%></td>
                                            <td><%= dto.getTo()%></td>
                                            <td><%= dto.getAdult()%></td>
                                            <td><%= dto.getChild()%></td>
                                            <td><%= dto.getRoomID()%></td>
                                            <td><%= dto.getAmount()%></td>
                                            <td><%= dto.getPaytime()%></td>

                                        </tr>

                                    </tbody>
                                    <%
                                            }
                                        } else {
                                            System.out.println("No record");
                                        }
                                    %>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- Main End -->
    </body>
</html>
