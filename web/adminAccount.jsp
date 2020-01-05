
<%@page import="trangbtt.dtos.RegistrationErrorObject"%>
<%@page import="trangbtt.dtos.SignInDTO"%>
<%@page import="java.util.List"%>
<%@page import="trangbtt.daos.SignInDAO"%>
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
        <link rel="stylesheet" href="css/sr.css" type="text/css">

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
            <!-- Page Content -->

            <div id="page-content-wrapper">
                <div class="container-fluid xyz">
                    <div class="row">
                        <div class="col-lg-12">

                            <div class="container table-responsive py-5">
                                <form action="SearchHistoryController" method="POST" class="searchS" style="padding-left:200px; padding-right: 200px; ">
                                    <input type="text" name="txtSearch" class="form-control" autocomplete="off" placeholder="Name">
                                    <input type="submit" value="Search" class="buttonS" style="width: 100px;">
                                </form>
                                <%
                                    List<SignInDTO> resultS = (List<SignInDTO>) request.getAttribute("INFO");
                                    if (resultS != null) {
                                        if (resultS.size() > 0) {
                                %>
                                <table class="table table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">No</th>
                                            <th scope="col">Phone</th>
                                            <th scope="col">Fullname</th>
                                            <th scope="col">Role</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            int count = 0;
                                            for (SignInDTO dto : resultS) {
                                                count++;

                                        %>
                                        <tr>

                                            <td><%= count%></td>
                                            <td><%= dto.getPhone()%> </td>

                                            <td><%= dto.getFullname()%></td>
                                            <td><%= dto.getRole()%></td>


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
                                <div class="table-header">
                                    <span  style="font-size: 20px;font-weight: bold">ACCOUNT ADMIN & STAFF</span>

                                </div>

                                <table class="table table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">No</th>
                                            <th scope="col">Phone</th>
                                            <th scope="col">Password</th>
                                            <th scope="col">Fullname</th>
                                            <th scope="col">Role</th>
                                            <th scope="col">Delete</th>
                                            <th scope="col">Edit</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <form action="InsertController" method="POST">
                                        <%
                                            RegistrationErrorObject errObj = (RegistrationErrorObject) request.getAttribute("INVALID");
                                        %>
                                        <td>#</td>
                                        <td><input type="text" name="txtPhone">
                                            <%
                                                if (errObj
                                                        != null) {
                                                    if (errObj.getPhoneErr() != null) {


                                            %>
                                            <br/><br/>
                                            <font color="red">
                                            ${requestScope.INVALID.phoneErr}
                                            </font>
                                            <%        }
                                                }
                                            %>
                                        </td>
                                        <td><input type="text" name="txtPassword"><br/><br/>
                                            <font color="red">
                                            ${requestScope.INVALID.passwordErr}
                                            </font>
                                        </td>

                                        <td><input type="text" name="txtFullname"><br/><br/>
                                            <font color="red">
                                            ${requestScope.INVALID.fullnameErr}
                                            </font>
                                        </td>
                                        <td>
                                            <select name="cboRole">
                                                <option>admin</option>
                                                <option>staff</option>
                                            </select> <br/>
                                            <font color="red">
                                            ${requestScope.INVALID.confirmErr}
                                            </font>

                                        </td>
                                        <td><input type="submit" value="Insert"></td>

                                    </form>

                                    </tbody>
                                    <%
                                        SignInDAO dao = new SignInDAO();
                                        List<SignInDTO> result = dao.loadAccount();
                                        if (result
                                                != null) {
                                            int count = 0;
                                            for (SignInDTO dto : result) {
                                                count++;
                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%= count%></td>
                                            <td><%= dto.getPhone()%></td>
                                            <td><%= dto.getPassword()%></td>
                                            <td><%= dto.getFullname()%></td>
                                            <td><%= dto.getRole()%></td>
                                            <td>
                                                <form action="DeleteController" method="POST">
                                                    <input type="hidden" value="<%= dto.getPhone()%>" name="id">
                                                    <input type="submit" value="Delete">

                                                </form>
                                            </td>
                                            <td>
                                                <form action="EditController" method="POST">
                                                    <input type="hidden" value="<%= dto.getPhone()%>" name="id">
                                                    <input type="submit" value="Edit">

                                                </form>
                                            </td>
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