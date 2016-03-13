
<%@ page import="com.ttnd.linksharing.Topic" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>

    <title></title>
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
        <div class="panel panel-default" style="margin:15px">
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-4">
                        <span class="glyphicon glyphicon-user" style="font-size:90px; border:1px solid"></span>
                    </div>
                    <div class="col-sm-8">
                        <div class="row">
                            <h4>${session.user}</h4>
                            <p class="text-muted">@${session.user}</p>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <p class="text-muted">subscriptions</p>
                                <ls:subscriptionCount userId="${session.user.id}"></ls:subscriptionCount>
                            </div>
                            <div class="col-sm-6">
                                <p class="text-muted">Topics </p>
                                <ls:userTopics></ls:userTopics>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="row" style="margin: 5px">
        <g:render template="/topic/subscribedTopics" map="${subscribedTopics}"/>
         </div>
    <div class="row">
        <ls:trendingTopics/>
    </div>
</div>
</div>

<div class="col-sm-6">

    <g:render template="/user/index" map="${readingItems}"/>
</div>
</div>
</body>
</html>