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
          <link rel="stylesheet" href="/path/to/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,700|Roboto:400,500&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/sr.css" type="text/css">
        <link rel="stylesheet" href="css/jquery.datetimepicker.min.css">
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