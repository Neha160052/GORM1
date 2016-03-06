<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
<div class="container">
    <div class="col-sm-6" style="margin:15px">
        <g:render template="/resource/show" map="${recentResources}"/>
        <div class="row">
            <div class="panel panel-default">

                <div class="panel-heading">
                    <div class="row">
                        <div class="col-sm-8"><h3 class="panel-title">Top Posts</h3></div>
                        <div class="col-sm-4"></div><select class="form-control" style="width:100px">
                        <option></option>
                        <option>Today</option>
                        <option>One week</option>
                        <option>One month</option>
                        <option>One year</option>
                    </select>
                    </div>
                </div>
        <g:render template="/topic/show" collection="${topPosts}" var="topPost"/>
                </div>
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