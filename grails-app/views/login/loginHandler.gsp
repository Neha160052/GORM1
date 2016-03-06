<%--
  Created by IntelliJ IDEA.
  User: neha
  Date: 2/3/16
  Time: 3:18 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>

    <title></title>
</head>

<body>
<div class="container">
<div class="col-sm-6">
    <!--first Box-->
    <div class="row">
        <div class="panel panel-default" style="margin:15px">
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-4">
                        <span class="glyphicon glyphicon-user" style="font-size:90px; border:1px solid"></span>
                    </div>
                    <div class="col-sm-8">
                        <div class="row">
                            <h4>Uday Partap Singh</h4>
                            <p class="text-muted">@uday</p>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <p class="text-muted">subscribers</p>
                                <a href="#">34</a>
                            </div>
                            <div class="col-sm-6">
                                <p class="text-muted">Topics </p>
                                <a href="#">30</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    <div class="row">
    <g:render template="/topic/trendingTopics" map="${trendingTopics}"/>
    </div>
</div>
</div>

<div class="col-sm-6">
    <g:render template="/user/index"/>
</div>
</div>
</body>
</html>