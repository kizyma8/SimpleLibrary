<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'basic.css')}" type="text/css">
</head>

<body>
<div class="content-header">
    <span id="banner">SimpleLibrary</span>

    <div class="button-bar">
        <sec:ifNotLoggedIn>
            <div class="link">
                <g:link style="text-decoration: none; color:white; font-size: smaller;" controller="user"
                        action="formReg">Sign up now</g:link></div></br>
            <div class="link"><g:link style="text-decoration: none; color:white; font-size: smaller;" controller="login"
                                      action="index">Login</g:link></div>
        </sec:ifNotLoggedIn>
        <sec:ifLoggedIn>
            <div class="link"><g:remoteLink style="text-decoration: none; color:white; font-size: smaller;"
                                            class="logout buttons" controller="logout">Logout</g:remoteLink></div>
            <div>UserName:<sec:username/></div>
        </sec:ifLoggedIn>

    </div>

    <div class="user-inf" style="margin-top: 5%">

        <sec:ifAnyGranted roles="ROLE_ADMIN">
            <div id="add-book"><g:link style="text-decoration: none; color:white; font-size: smaller; "
                                       controller="books" action="addBook">Add new book</g:link></div>
        </sec:ifAnyGranted>

        <g:form url='[controller: "books", action: "search"]' id="searchableForm" name="searchableForm" method="get">
            <g:textField name="q" value="${params.q}" size="50"/> <input style="background: white;
        color: black;
        border-radius: 15px;
        border-color: white;
        font-weight: 700;
        border: none;" type="submit" value="Search"/>
        </g:form>
    </div>
</div>

<div class="content-body">
    <div class="container">
        <div class="book-container">

            <div style=" width:100%; height:1px; clear:both;">.</div>
            <g:each in="${books}" var="book" >
                <div class="sbook">
                <div style="margin-top: 30%">
                    <g:link style="text-decoration: none; color: black; font-weight: 600; "  controller = "books" action="show" id="${book.id}">${book.title}</g:link>
                </div>
                    Author:${book.author}
                </div>
            </g:each>
        </div>
    </div>
</div>
</body>
</html>