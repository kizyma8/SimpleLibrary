<%--
  Created by IntelliJ IDEA.
  User: Женя
  Date: 08.06.2017
  Time: 13:45
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main1.css')}" type="text/css">--}%
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'basic.css')}" type="text/css">
    <title></title>
    <script type="text/javascript"
            src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
</head>

<body>
<div class="content-body">
    <div id="reg">
        <g:form style="height: 85%;" controller="user" action="register">
            <div class="header-login"><div style="padding-top: 2%">Sign Up</div></div>

            <div class="body-login">
                <div class="input-form">
                    <div class='login_message'>${flash.message}</div>
                    <div>Username:</div>
                    <g:textField name="username"/></div>

                <div class="input-form"><div>Password:</div>
                    <g:passwordField name="password" autocomplete="new-password" id="password"/></div>

                <div class="input-form"><div>First Name:</div>
                    <g:textField name="firstName"/></div>

                <div class="input-form"><div>Last Name:</div>
                <g:textField name="lastName"/></div>


                <g:submitButton style="margin-bottom: 2%" class="button" name="submitButton" value="Create Account"/>
            </div>
        </g:form>
        <div class="footer-form">
            <div style="padding-top: 2%">If already you have account! <g:link style="text-decoration: none; color:white; font-size: 17px; margin-left: 1%;" controller="login" action="index">Sign In</g:link></div>

        </div>
    </div>
</div>
</body>
</html>