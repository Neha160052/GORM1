
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-3">
                    <span class="glyphicon glyphicon-user" style="font-size:90px; border:1px solid"></span>
                </div>
                <div class="col-sm-9">
                    <div class="row" style="font-size:25px">
                        <div class="col-sm-4" style="font-size:8px">${topPost.createdBy}</div>
                        <div class="col-sm-6" style="font-size:8px"><p class="text-muted">@${topPost.createdBy} 10min</p></div>
                        <div class="col-sm-2" style="font-size:8px">
                            <g:link controller="topic" action="show" params="[topicId:topPost.topic?.id]">${topPost.topic}</g:link>
                        </div>
                    </div>
                    <div class="row">
                        <p>${topPost.discription}</p>
                    </div>
                    <div class="row">
                        <div class="col-sm-1">
                            <i class="fa fa-facebook-square" ></i>
                        </div>
                        <div class="col-sm-1">
                            <span class="fa fa-tumblr"></span>
                        </div>
                        <div class="col-sm-6">
                            <span class="fa fa-google-plus"></span>
                        </div>
                        <div class="col-sm-4">
                            <g:link controller="resource" action="show" params="[id:topPost?.id]">View Post</g:link>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <div>
        </div>

