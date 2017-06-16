
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Show book</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'basic.css')}" type="text/css">

</head>

<body>
<div class="content-header">
    <span id="banner">SimpleLibrary</span>
    <div class="button-bar">
        <sec:ifNotLoggedIn>
            <div class="link">
                <g:link style="text-decoration: none; color:white; font-size: smaller;" controller="user" action="formReg">Sign up now</g:link></div></br>
            <div class="link"><g:link style="text-decoration: none; color:white; font-size: smaller;" controller="login" action="index">Login</g:link></div>
        </sec:ifNotLoggedIn>
        <sec:ifLoggedIn>
            <div class="link"> <g:remoteLink style="text-decoration: none; color:white; font-size: smaller;" class="logout buttons" controller="logout">Logout</g:remoteLink></div>
            <div>UserName:<sec:username/></div>
        </sec:ifLoggedIn>

    </div>
    <div class="user-inf" style="    margin-top: 5%;">

        <sec:ifAnyGranted roles="ROLE_ADMIN">
            <div id="add-book" class="line" >  <g:link style="text-decoration: none; color:white; font-size: smaller; " controller="books" action="addBook">Add new book</g:link></div>
        </sec:ifAnyGranted>
        <div class="line"> <g:link style="text-decoration: none; color:white; font-size: 17px;    " controller="user" action="home">Show all books</g:link></div>
    </div>
</div>
<div class="content-body">
    <div class="container">
        <div class="book-container">
<g:each in="${books}" var="book" >
  <div class="book-field" id="title1" style="margin-top: 5%;
  font-size: 40px;
  font-weight: 600;"> ${book.title}</div>
    <div class="book-field" id="author" style="font-weight: 600;">Author:   ${book.author}</div>
    <div class="book-field">Description:  ${book.description}</div>
  <div style="margin-top: 2%"> <g:link style="text-decoration: none; color: black; font-weight: 600;" action="downloadFile" id="${book.id}">
        Download book
    </g:link></div>
    <sec:ifAnyGranted roles="ROLE_ADMIN">
    <g:link style="text-decoration: none; color: black; font-weight: 600; "  controller = "books" action="deleted" id="${book.id}">Deleted book</g:link>
    </sec:ifAnyGranted>
</g:each>
        </div>
    </div>
</div>
</body>
</html>