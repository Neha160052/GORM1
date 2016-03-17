

<div class="row">
    <div class="panel panel-default">

        <div class="panel-heading">
            <h3 class="panel-title">Posts: "${topic.name}"</h3>
            %{--<div class="col-sm-offset-5">--}%
            %{--<g:form class="form-inline" controller="resource" action="search">--}%
            %{--<g:textField class="form-control" name="search" placeholder="search...."></g:textField>--}%
            %{--<input type="hidden" name="topicId" value="${topic?.id}"/>--}%
            %{--<g:submitButton name="search" ></g:submitButton>--}%
            %{--</g:form>--}%
            %{--</div>--}%
        </div>
        <div class="panel-body">
            <g:each in="${topic.resources}" var="resources">
            <div class="row">
            <div class="col-sm-3">
                <span class="glyphicon glyphicon-user" style="font-size:90px; border:1px solid"></span>
            </div>
            <div class="col-sm-9">
                <div class="row" style="font-size:15px">
                    <div class="col-sm-4" style="font-size:8px">${resources.createdBy}</div>
                    <div class="col-sm-6" style="font-size:8px"><p class="text-muted">@${resources.createdBy} 10min</p></div>
                    <div class="col-sm-2" style="font-size:8px">
                        <g:link controller="topic" action="show" params="[topicId:resources.topic.id]">${resources.topic}</g:link>
                    </div>
                </div>

                <div class="row">
                    <p>${resources.discription}</p>
                </div>

                <div class="row">
                    <div class="col-sm-3">
                        <span>
                            <i class="fa fa-facebook-official" ></i>
                            <i class="fa fa-tumblr"></i>
                            <i class="fa fa-google-plus"></i>
                        </span>
                    </div>
                    <div class="col-sm-9">

                        <ls:resourceType resourceId="${resources.id}"/>
                    </div>
                </div>
            </div>
        </div>
                <hr role="separator" class="divider" />
            </g:each>
       </div>
    </div>
</div>