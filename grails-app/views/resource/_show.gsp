<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Recent Shares</h3>
        </div>

        <div class="panel-body">
            <g:each in="${recentResources}" var="recentResource">


            <div class="row">
                <div class="col-sm-3">
                    <span class="glyphicon glyphicon-user" style="font-size:90px; border:1px solid"></span>
                </div>
                <div class="col-sm-9">

                    <div class="row" style="font-size:15px">
                        <div class="col-sm-4" style="font-size:8px">${recentResource.createdBy}</div>
                        <div class="col-sm-6" style="font-size:8px"><p class="text-muted">@${recentResource.createdBy} 10min</p></div>
                        <g:link controller="topic" action="show" params="[topicId:recentResource.topic?.id]">${recentResource.topic}</g:link>
                    </div>

                    <div class="row">
                        <p>${recentResource.discription}</p>
                    </div>

                    <div class="row">
                        <div class="col-sm-1">
                            <div>
                                <i class="fa fa-facebook-official" ></i>
                            </div>
                        </div>
                        <div class="col-sm-1">
                            <span class="fa fa-tumblr"></span>
                        </div>
                        <div class="col-sm-6">
                            <span class="fa fa-google-plus"></span>
                        </div>
                        <div class="col-sm-4">
                            <g:link controller="resource" action="show" params="[id:recentResource?.id]">View Post</g:link>
                        </div>
                    </div>
                </div>
            </div>
                <hr role="separator" class="divider" />
            </g:each>
        </div>

    </div>
</div>