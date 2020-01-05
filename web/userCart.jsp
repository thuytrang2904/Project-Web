
<%@page import="trangbtt.dtos.CartAddDTO"%>
<%@page import="trangbtt.models.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <!-- Google Font -->
        <link
            href="https://fonts.googleapis.com/css?family=Montserrat+Alternates:100,200,300,400,500,600,700,800,900&display=swap"
            rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="css/sr.css" type="text/css">
    </head>

    <body>
         <c:if test="${sessionScope.ROLE ne 'user'}">
            <jsp:forward page="index.jsp" />
        </c:if>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
        <header class="header-section">
            <div class="container-fluid">
                <div class="inner-header">
                    <div class="logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                    <div class="nav-right">
                        <form action="LogoutController" method="POST">
                            <input type="submit"  class="primary-btn"  value="LOG OUT"/> 
                        </form>
                    </div>
                    <nav class="main-menu mobile-menu">
                        <ul>
                            <li><a href="userHome.jsp">Home</a></li>
                            <li class="active"><a href="userRoom.jsp">Rooms</a></li>
                            <li><a href="userReserver.jsp">Reservation</a>

                            </li>
                            <li><a href="editProfileUser.jsp">Edit Profile</a></li>
                            <li><a href="userCart.jsp">Your Card</a></li>
                            <li><a href="historyCart.jsp">History</a></li>

                        </ul>
                    </nav>
                    <div id="mobile-menu-wrap"></div>
                </div>
            </div>
        </header>
        <!-- Header End -->

        <!-- Hero Area Section Begin -->
        <div class="hero-area set-bg other-page" data-setbg="img/hero1_bg.jpg">
        </div>
        <!-- Hero Area Section End -->
        <!-- Main -->
        <h3 id="itemCart">Your Cart</h3>
        <%
            Cart shoppingCart = (Cart) session.getAttribute("cart");


        %>
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
                                            <th scope="col">Phone</th>
                                            <th scope="col">From</th>
                                            <th scope="col">To</th>
                                            <th scope="col">Adult</th>
                                            <th scope="col">Childrent</th>
                                            <th scope="col">Room Number</th>
                                            <th scope="col">Room Type</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Delete</th>
                                        </tr>
                                    </thead>
                                    <%                                        if (shoppingCart != null) {
                                    %>
                                    <tbody>
                                        <%
                                            int count = 0;
                                            for (CartAddDTO dto : shoppingCart.getCart()) {
                                                if (shoppingCart.getCart() != null) {

                                                    count++;


                                        %>
                                        <tr>
                                            <td><%= count%></td>
                                            <td><%= session.getAttribute("PHONE")%></td>
                                            <td><%= dto.getFrom()%></td>
                                            <td><%= dto.getTo()%></td>
                                            <td><%= dto.getAdult()%></td>
                                            <td><%= dto.getChild()%></td>
                                            <td><%= dto.getRoomID()%></td>
                                            <td><%= dto.getType()%></td>
                                            <td><%= dto.getPrice()%></td>
                                            <td>
                                                <form action="DeleteCartController" method="POST">
                                                    <input type="hidden" value="<%= count%>" name="id">
                                                    <input type="submit" value="Delete">

                                                </form>
                                            </td>


                                        </tr>
                                        <%
                                                } else {
                                                    System.out.println("No");
                                                }
                                            }
                                        %>
                                        <tr>
                                            <td></td>
                                            <td>Total</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td><%= shoppingCart.getTotal()%></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                    <%
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
        <!-- Edit Cart  -->
        <div style="display: flex; justify-content: flex-end;  " class="updateTT">
            <form action="OrderController" method="POST" >
                <input type="submit" value="Ordered" style="width: 100px; margin-right: 200px; margin-bottom: 50px;">
            </form>


        </div>
        <!-- Edit Cart End -->
        <!-- Footer Section Begin -->
        <footer class="footer-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="footer-item">
                            <div class="footer-logo">
                                <a href="#"><img src="img/logo.png" alt=""></a>
                            </div>
                            <p>Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                                dolore magna aliqua.</p>
                        </div>
                    </div>
                    <div class="col-lg-4">

                    </div>
                    <div class="col-lg-4">
                        <div class="footer-item">
                            <h5>Contact Info</h5>
                            <ul>
                                <li><img src="img/placeholder.png" alt="">1525 Boring Lane,<br />Los Angeles, CA</li>
                                <li><img src="img/phone.png" alt="">+1 (603)535-4592</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </footer>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>