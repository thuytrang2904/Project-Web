<%-- 
    Document   : userHome
    Created on : Dec 3, 2019, 6:09:38 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Hotel Template">
        <meta name="keywords" content="Hotel, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Europa Hotel & Spa | Template</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat+Alternates:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

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
                            <li class="active"><a href="userHome.jsp">Home</a></li>
                            <li><a href="userRoom.jsp">Rooms</a></li>
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
        <section class="hero-area set-bg" data-setbg="img/hero-bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="hero-text">
                            <h1>A Luxury Stay</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Area Section End -->



        <!-- Intro Text Section Begin -->
        <section class="intro-section spad">
            <div class="container">
                <div class="row intro-text">
                    <div class="col-lg-6">
                        <div class="intro-left">
                            <div class="section-title">
                                <span>a memorable holliday</span>
                                <h2>A great stay in a<br /> lovely hotel.</h2>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                                labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo
                                viverra maecenas. Donec in sodales dui, a blandit nunc. Pellentesque id eros venenatis,
                                sollicitudin neque sodales, vehicula nibh. Nam massa odio, porttitor vitae efficitur non,
                                ultricies volutpat tellus.</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="intro-right">
                            <p>Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                                dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra.</p>
                            <a href="userReserver.jsp" class="primary-btn">Make a Reservation</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Intro Text Section End -->

        <!-- Facilities Section Begin -->
        <section class="facilities-section">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="facilities-item set-bg" data-setbg="img/faci-1.jpg">
                            <div class="fi-title">
                                <h2>Luxury Suite Room</h2>
                                <p>From $399</p>
                            </div>
                            <div class="fi-features">
                                <div class="fi-info">
                                    <i class="flaticon-019-television"></i>
                                    <p>Smart TV</p>
                                </div>
                                <div class="fi-info">
                                    <i class="flaticon-029-wifi"></i>
                                    <p>High Wi-fii</p>
                                </div>
                                <div class="fi-info">
                                    <i class="flaticon-003-air-conditioner"></i>
                                    <p>AC</p>
                                </div>
                                <div class="fi-info">
                                    <i class="flaticon-036-parking"></i>
                                    <p>Parking</p>
                                </div>
                                <div class="fi-info">
                                    <i class="flaticon-007-swimming-pool"></i>
                                    <p>Pool</p>
                                </div>
                            </div>
                            <a href="userReserver.jsp" class="primary-btn">Make a Reservation</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="facilities-item set-bg fi-right" data-setbg="img/faci-2.jpg">
                            <div class="fi-title">
                                <h2>Infinity Pool</h2>
                                <p>For all our guests</p>
                            </div>
                            <a href="userReserver.jsp" class="primary-btn">Make a Reservation</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Facilities Section End -->

        <!-- Testimonial Section Begin -->
        <section class="testimonial-section spad">
            <div class="container">
                <div class="row">
                    <div class="section-title">
                        <h2>Guestbook</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="testimonial-item">
                            <div class="ti-time">
                                02 / 02 / 2019
                            </div>
                            <h4>We loved our stay</h4>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiselit. Vivamus libero mauris, bibendum eget
                                sapien ac, ultrices rhoncus ipsum. Donec nec sapien in urna fermentum ornare.</p>
                            <div class="ti-author">
                                <div class="author-pic">
                                    <img src="img/author-1.png" alt="">
                                </div>
                                <div class="author-text">
                                    <h6>JOHN DOE <span>Madrid</span></h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="testimonial-item">
                            <div class="ti-time">
                                02 / 02 / 2019
                            </div>
                            <h4>I will come back again</h4>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <p>Ipsum dolor sit amet, consectetur adipiselit. Vivamus libero mauris, bibendum eget sapien ac,
                                ultrices rhoncus ipsum. Donec nec sapien in urna fermentum ornare.</p>
                            <div class="ti-author">
                                <div class="author-pic">
                                    <img src="img/author-2.png" alt="">
                                </div>
                                <div class="author-text">
                                    <h6>Maria Smith <span>Madrid</span></h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Testimonial Section End -->

        <!-- Video Section Begin -->
        <div class="video-section">
            <div class="video-bg set-bg" data-setbg="img/video-bg.jpg"></div>
            <div class="container">
                <div class="video-text set-bg" data-setbg="img/video-inside-bg.jpg">
                    <a href="https://www.youtube.com/watch?v=j56YlCXuPFU" class="pop-up"><i class="fa fa-play"></i></a>
                </div>
            </div>
        </div>
        <!-- Video Section End -->

        <!-- Home Page About Section Begin -->
        <section class="homepage-about spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="about-text">
                            <div class="section-title">
                                <h2>“Customers love our <br />facilities”</h2>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus libero mauris, bibendum eget
                                sapien ac, ultrices rhoncus ipsum. Donec nec sapien in urna fermentum ornare. Morbi vel
                                ultrices leo. Sed eu turpis eu arcu vehicula fringilla ut vitae orci. Suspendisse maximus
                                malesuada. </p>
                            <a href="userReserver.jsp" class="primary-btn">Make a Reservation</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="about-img">
                                    <img src="img/home-about-1.jpg" alt="">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="about-img">
                                    <img src="img/home-about-2.jpg" alt="">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="about-img">
                                    <img src="img/home-about-3.jpg" alt="">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="about-img">
                                    <img src="img/home-about-4.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Home Page About Section End -->

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