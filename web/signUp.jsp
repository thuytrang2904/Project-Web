<%-- 
    Document   : signUp
    Created on : Dec 9, 2019, 6:25:13 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="./css/editProfile.css">
    <body>
        <form action="SignUpController" method="post">

            <h1>Sign Up</h1>

            <fieldset>
                <legend><span class="number">1</span>INFORMATION</legend>

                <label for="name">Phone:</label>
                <input type="text" name="txtPhone" value="${param.txtPhone}"placeholder="Phone" />
                <font color="red">
                ${requestScope.INVALID.phoneErr}
                </font>
                <br/>
                <label for="name">Full Name:</label>
                 <input type="text" name="txtFullname"placeholder="User" />
                <font color="red">
                ${requestScope.INVALID.fullnameErr}
                </font>
                <br/>
                <label for="password">Password:</label>
               <input type="password" name="txtPassword"placeholder="Password" />
                <font color="red">
                ${requestScope.INVALID.passwordErr}
                </font>
                <br/>
                <label for="password">Confirm Password:</label>
                 <input type="password" name="txtConfirm" placeholder="Confirm Password" />
                <font color="red">
                ${requestScope.INVALID.confirmErr}
                </font>
                <br/>

            </fieldset>


        </fieldset>
        <input class="formInput" type="submit" value="Sign Up"></button>
    </form>
</body>
</html>
