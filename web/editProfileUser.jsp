<%-- 
    Document   : editProfileUser
    Created on : Dec 9, 2019, 3:24:46 PM
    Author     : ASUS
--%>

<%@page import="trangbtt.dtos.SignInDTO"%>
<%@page import="trangbtt.dtos.RegistrationErrorObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up Form</title>
<!--        <link rel="stylesheet" href="css/normalize.css">-->
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="./css/editProfile.css">
    </head>

    <body>
         <%
                RegistrationErrorObject errObj = (RegistrationErrorObject) request.getAttribute("INVALID");
            %>
        <form action="UpdateProfileController" method="post">

            <h1>Edit Profile</h1>
           
            <fieldset>
                <legend><span class="number">1</span>INFORMATION</legend>

                <label for="name">Phone:</label>
                <input type="text"  name="txtPhoneE" value="${sessionScope.PHONE}" readonly="true" >
                <br/>
                <label for="name">Full Name:</label>
                <input type="text"  name="txtFullnameE" placeholder="User">
                <font color="red">
                ${requestScope.INVALID.fullnameErr}
                </font>
                <br/>
                <label for="password">Password:</label>
                <input type="password"  name="txtPasswordE">
                <font color="red">
                ${requestScope.INVALID.passwordErr}
                </font>
                <br/>
                <label for="password">Confirm Password:</label>
                <input type="password"name="txtConfirmPasswordE">
                <font color="red">
                ${requestScope.INVALID.confirmErr}
                </font>
                <br/>

            </fieldset>


        </fieldset>
        <input class="formInput" type="submit" value="Save"></button>
    </form>


</body>

</html>
