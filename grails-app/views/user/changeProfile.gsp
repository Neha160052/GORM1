

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${session.user}'s Profile</title>
</head>

<body>
<g:if test="${flash.error}">
    <div class="alert alert-warning" style="display: block">${flash.error}</div>
</g:if>
<g:if test="${flash.message}">
    <div class="alert alert-success" style="display: block">${flash.message}</div>
</g:if>
<div class="container">
    <div class="col-sm-6">
         <div class="row">
             <g:render template="/user/userDetails" model="[user:session.user]"/>
         </div>
         <div class="row" style="margin: 5px">
             <g:render template="/user/topics" model="[topics:topics,uniqueIdForTopicEdit:session.uniqueIdForTopicEdit]"/>
         </div>
    </div>
    <div class="col-sm-6">
        <div class="row">
            <g:render template="/user/profile"/>
        </div>
        <div class="row">
            <g:render template="/user/changePassword"/>
        </div>


    </div>
</div>

</body>
</html>