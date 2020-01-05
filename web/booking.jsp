<%-- 
    Document   : booking
    Created on : Dec 4, 2019, 7:37:52 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <link rel="stylesheet" href="css/jquery.datetimepicker.min.css">
</head>

<body>
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
                    <a href="#" class="primary-btn">Make a Reservation</a>
                </div>
                <nav class="main-menu mobile-menu">
                    <ul>
                        <li><a href="userHome.jsp">Home</a></li>
                        <li><a href="./about-us.html">About</a></li>
                        <li class="active"><a href="rooms.html">Rooms</a></li>
                        <li><a href="services.html">Service</a></li>
                        <li><a href="#">Reservation</a>

                        </li>

                        <li><a href="card.html">Your Card</a></li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Hero Area Section Begin -->
    <div class="hero-area set-bg other-page" data-setbg="img/about_bg.jpg">
    </div>
    <!-- Hero Area Section End -->

    <!-- Room Section Begin -->
    <section class="room-section">
        <div class="container-fluid">


            <div class="row">
                <div class="col-lg-6">
                    <div class="ri-slider-item">
                        <div class="ri-sliders owl-carousel">
                            <div class="single-img set-bg" data-setbg="img/rooms/room-3.jpg"></div>
                            <div class="single-img set-bg" data-setbg="img/rooms/room-4.jpg"></div>
                            <div class="single-img set-bg" data-setbg="img/rooms/room-1.jpg"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6" style="display: flex; justify-content: center; align-items: center;">
                    <div>

                        <h4>Make a Revervation</h4>

                        <div style="width: 200px;">
                            <p>From</p>
                            <div class="input-group">
                                <input type="text" id="picker1" class="form-control">
                                <div class="input-group-prepend">
                                    <button type="button" id="toggle1" class="input-group-text">
                                        <i class="far fa-calendar-alt"></i>
                                    </button>
                                </div>
                            </div>
                            <p>To</p>
                            <div class="input-group">
                                <input type="text" id="picker2" class="form-control">
                                <div class="input-group-prepend">
                                    <button type="button" id="toggle2" class="input-group-text">
                                        <i class="far fa-calendar-alt"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="room-quantity">
                            <div class="single-quantity">
                                <p>Adults</p>
                                <input type="number" min="0" max="8" value="1" style="width: 80%;">
                            </div>
                            <div class="single-quantity">
                                <p>Children</p>
                                <input type="number" min="0" max="8" value="0" style="width: 80%;">
                            </div>
                            <div class="single-quantity last">
                                <p>Rooms</p>
                                <input type="number" min="1" max="8" value="1" style="width: 80%;">
                            </div>
                        </div>
                        <div class="room-selector">
                            <p>Room type</p>
                            <select class="suit-select">
                                <option value="" selected disabled hidden>Choose here</option>
                                <option value="">Double Room</option>
                                <option value="">Single Room</option>

                            </select>
                        </div>
                        <br /> <br />
                        <div class="room-selector">
                            <p>Address</p>
                            <select class="suit-select">
                                <option value="" selected disabled hidden>Choose here</option>
                                <option value="">123 Quang Trung, Go vap, TP HCM</option>
                                <option value="">12 Vo Van Ngan, Thu Duc, TP HCM</option>
                                <option value="">22 Nguyen Trai , Quan 1, TP HCM</option>
                            </select>
                            <br /> <br /><br />
                            <div>
                                <a href="card.html" class="primary-btn">Order</a>
                            </div>

                        </div>


                    </div>
                </div>
            </div>
        </div>

    </section>
    <!-- Room Section End -->

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
    <script src="https://kit.fontawesome.com/c4b1e58fe3.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    <script src="js/jquery.datetimepicker.full.min.js"></script>
    <script>
        $('#picker1').datetimepicker({
            timepicker: false,
            datepicker: true,
            format: 'y-m-d',
            weeks: false,
            onShow: function (ct) {
                this.setOptions({
                    minDate: new Date().getDate,
                    maxDate: $('#picker2').val() ? $('#picker2').val() : false
                })
            }
        });
        $('#picker2').datetimepicker({
            timepicker: false,
            datepicker: true,
            format: 'y-m-d',
            weeks: false,
            onShow: function (ct) {
                this.setOptions({
                    minDate: $('#picker1').val() ? $('#picker1').val() : false
                })
            }
        });
        $('#toggle1').on('click', () => {
            $('#picker1').datetimepicker('toggle')
        });
        $('#toggle2').on('click', () => {
            $('#picker2').datetimepicker('toggle')
        });
    </script>
    <script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>

</html>
