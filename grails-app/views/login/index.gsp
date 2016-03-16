<html>
<head>
    <meta name="layout" content="main"/>
    <title>Linksharing</title>
</head>
<body>
<g:if test="${flash.error}">
    <div class="alert alert-danger" style="display: block">${flash.error}</div>
</g:if>
<g:if test="${flash.message}">
    <div class="alert alert-success" style="display: block">${flash.message}</div>
</g:if>
<div class="container">
    <div class="col-sm-6" style="margin:15px">
        <g:render template="/resource/show" map="${recentResources}"/>
        <div class="row">
           <g:render template="/topic/topPost" map="${topPosts}"/>
        </div>
</div>
    <div class="col-sm-5" style="margin:20px">
        <g:render template="/user/login"/>
       <g:render template="/user/register"/>
    </div>
</div>
</div>
</body>
</html>