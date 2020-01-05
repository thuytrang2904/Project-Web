<%@page import="trangbtt.daos.BillDAO"%>
<%@page import="java.util.List"%>
<%@page import="trangbtt.dtos.BillDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/admin.css" type="text/css">
        <link rel="stylesheet" href="./css/sr.css" type="text/css">


    </head>

    <body>
        <c:if test="${sessionScope.ROLE ne 'admin'}">
            <jsp:forward page="index.jsp" />
        </c:if>
        <nav class="navbar navbar-default no-margin">
            <img src="./img/admin.png" alt="" style="width: 230px;">
        </nav>
        <div id="wrapper">
            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav nav-pills nav-stacked" id="menu">
                    <li class="active">
                        <a href="admin.jsp"><span class="fa-stack fa-lg pull-left"><i
                                    class="fa fa-dashboard fa-stack-1x "></i></span> ADMIN</a>

                    </li>
                    <li>
                        <a href="adminAccount.jsp"><span class="fa-stack fa-lg pull-left"><i
                                    class="fa fa-flag fa-stack-1x "></i></span>STAFF</a>

                    </li>
                    <li>
                        <a href="adminRoom.jsp"><span class="fa-stack fa-lg pull-left"><i
                                    class="fa fa-cloud-download fa-stack-1x "></i></span>ROOM</a>
                    </li>
                    <li>
                        <a href="history.jsp"> <span class="fa-stack fa-lg pull-left"><i
                                    class="fa fa-cart-plus fa-stack-1x "></i></span>HISTORY</a>
                    </li>
                    <li>
                        <form action="LogoutController" method="POST">
                            <input type="submit"  class="primary-btn"  value="LOG OUT"/> 
                        </form>
                    </li>
                </ul>
            </div>
            <!-- /#sidebar-wrapper -->
            <!--            <form action="SearchStaffController" method="POST" class="searchS" style="padding-left:200px; padding-right: 200px; ">
                            <input type="text" name="txtSearch" class="form-control"  placeholder="Phone">
                            <input type="text" name="txtSearch" class="form-control"  placeholder="Phone">
                            <input type="submit" value="SEARCH" class="buttonS" style="width: ">
                        </form>-->
            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid xyz">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <!--                                <div class="searchS">
                                                                    <input type="text" class="form-control" placeholder="Date">
                                                                    <a href="searchBillAdmin.jsp" class="buttonS">SEARCH</a>  
                                                                </div>-->
                                <div class="table-header">
                                    <span class="table-title">ALL BILL</span>

                                </div>
                                <table class="material-table">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Phone</th>
                                            <th>Fullname</th>
                                            <th>From</th>
                                            <th>To</th>
                                            <th>Date Order</th>
                                            <th>Pay Time</th>
                                            <th>Amount</th>
                                        </tr>
                                    </thead>
                                    <%
                                        BillDAO dao = new BillDAO();
                                        List<BillDTO> result = dao.loadBill();
                                        if (result != null) {
                                            int count = 0;
                                            for (BillDTO dto : result) {
                                                count++;
                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%= count%></td>
                                            <td><%= dto.getPhone()%></td>
                                            <td><%= dto.getName()%></td>
                                            <td><%= dto.getFrom()%></td>
                                            <td><%= dto.getTo()%></td>
                                            <td><%= dto.getDateOrder()%></td>
                                            <td><%= dto.getPaytime()%></td>
                                            <td><%= dto.getAmount()%></td>
                                        </tr>
                                    </tbody>
                                    <%
                                            }
                                        }
                                    %>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /#page-content-wrapper -->
        </div>
        <!-- /#wrapper -->
        <!-- jQuery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        <script src="./js/admin.js"></script>


    </body>

</html>