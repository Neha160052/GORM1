
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${user}</title>
</head>
<body>
    <div class="col-sm-6">
        <div class="row" style="margin: 10px">
            <g:render template="/user/userDetails" model="[user:user]"/>
        </div>
        <div class="row" style="margin: 20px">
            <g:render template="/user/topics" model="[topics:user.topics,uniqueIdForTopicEdit:1]"/>
        </div>
    </div>

    <div class="col-sm-6">

    </div>
</body>
</html>