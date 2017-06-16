
<%@ page import="org.compass.core.util.ClassUtils" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Search result</title>
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
</div>
<div id="main">
    <g:set var="haveQuery" value="${params.q?.trim()}" />
    <g:set var="haveResults" value="${searchResult?.results}" />
    <div class="content-body">
        <div class="container">
            <div class="book-container">

                <div style=" width:100%; height:1px; clear:both;">.</div>
                <g:if test="${haveResults}">

                        <g:each var="result" in="${searchResult.results}" status="index">
                            <div class="sbook">
                                <g:set var="className" value="${org.compass.core.util.ClassUtils.getShortName(result.getClass())}" />
                                <g:set var="link" value="${createLink( action: 'show', id:result.id)}" />
                                <div class="name"><a style="text-decoration: none; color: black; font-weight: 600" href="${link}">${result.title}</a></div>
                                <div class="desc"> Author:${result.author}</div>
                            </div>
                        </g:each>

                </g:if>
            </div>
        </div>

    </div>
    <div class="title">
        <span>
            <g:if test="${haveQuery && haveResults}">
                Showing <strong>${searchResult.offset + 1}</strong> - <strong>${searchResult.results.size() + searchResult.offset}</strong> of <strong>${searchResult.total}</strong>
                results for <strong>${params.q}</strong>
            </g:if>
            <g:else>
                &nbsp;
            </g:else>
        </span>
    </div>
    <div class="bad-result">
        <g:if test="${haveQuery && !haveResults && !parseException}">
            <p>Nothing matched your query - <strong>${params.q}</strong></p>

        </g:if>

        <g:if test="${parseException}">
            <p>Your query - <strong>${params.q}</strong> - is not valid.</p>

        </g:if>
    </div>
</div>

</body>
</html>