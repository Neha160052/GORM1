<div class="row" style="margin: 10px">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Index</h3>
        </div>

        <div class="panel-body">
            <g:each in="${readingItems}" var="post">


            <div class="row">
                <div class="col-sm-3">
                    <span class="glyphicon glyphicon-user" style="font-size:90px; border:1px solid"></span>
                </div>
                <div class="col-sm-9">

                    <div class="row" >
                        <div class="col-sm-4" style="font-size:8px">${post?.getNameOfUser()}</div>
                        <div class="col-sm-6" style="font-size:8px"><small class="text-muted">@${post?.userUserName}</small></div>
                        <g:link controller="topic" action="show" params="[topicId:post?.topicId]">${post?.topicName}</g:link>
                    </div>

                    <div class="row">
                        <p>${post?.description}</p>
                    </div>

                    <div class="row">
                        <div class="col-sm-3">
                            <span>
                                <i class="fa fa-facebook-official" ></i>
                                <i class="fa fa-tumblr"></i>
                                <i class="fa fa-google-plus"></i>
                            </span>
                        </div>
                        <div class="col-sm-9" style="font-size: 12px">
                            <div class="col-sm-4">
                                <ls:resourceType resourceId="${post?.resourceID}"/>
                            </div>
                            <div class="col-sm-4">
                            <ls:isRead resourceId="${post?.resourceID}"></ls:isRead>
                            </div>
                            <div class="col-sm-4">
                            <g:link controller="resource" action="show" params="[id:post?.resourceID]">View Post</g:link>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <hr role="separator" class="divider" />

            </g:each>
        </div>
    </div>
</div>