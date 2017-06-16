<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add book</title>
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main1.css')}" type="text/css">--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main2.css')}" type="text/css">--}%
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'basic.css')}" type="text/css">
</head>

<body>
<div class="content-header">
    <span id="banner">SimpleLibrary</span>

    <div class="button-bar">
        <sec:ifLoggedIn>
            <div class="link"><g:remoteLink style="text-decoration: none; color:white; font-size: smaller;"
                                            class="logout buttons" controller="logout">Logout</g:remoteLink></div>
        </sec:ifLoggedIn>
        <div>UserName:<sec:username/></div>
    </div>

    <div id="bunner-add">Add book</div>
    <g:link style="text-decoration: none; color:white; font-size: 17px; margin-left: 1%;" controller="user"
            action="home">Show all books</g:link>
</div>

<div class="content-body">
    <div class="input-book">
        <g:form controller="books" action="addBookPost" enctype="multipart/form-data">
            <div class="form-container">
                <div class="input-form">
                    <div>Title:</div>
                    <g:textField name="title" style="width: 70%"/></div>

                <div class="input-form"><div>Author:</div>
                    <g:textField name="author" style="width: 70%"/></div>

                <div class="input-form"><div>Description:</div>
                    <g:textArea style="
    width: 80%;" name="description" id="description" rows="8" cols="50"/></div>
            <div>${flash.message}</div>
            <div class="input-form"><input type="file" name="file"/></div>
            <g:submitButton class="button" name="submitButton" value="Add book"/>
        </g:form>
    </div>
            </div>




</div>
</body>
</html>