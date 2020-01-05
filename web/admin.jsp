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
            </div>
        </li>
    </ul>
</div>
<!-- /#sidebar-wrapper -->
<!-- Page Content -->
<div id="page-content-wrapper">
    <div class="container-fluid xyz">
        <div class="row">
            <div class="col-lg-12">
                <h1 style="text-align: center; margin-top: 100px;">WELCOME ADMIN</h1>
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