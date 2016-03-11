<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Resource</title>
</head>

<body>
<div class="col-sm-6">
    <g:render template="details" model="[resource: resource]"/>
</div>

<div class="col-sm-6">
    <g:if test="${session}">
        <ls:trendingTopics/>
    </g:if>

</div>
</body>
</html>