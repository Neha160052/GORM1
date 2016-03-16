<div class="row inbox-post">
    <div class="col-sm-3">
        <span class="glyphicon glyphicon-user" style="font-size:90px; border:1px solid"></span>
    </div>
    <div class="col-sm-9">

        <div class="row" style="font-size:15px">
            <div class="col-sm-4" style="font-size:8px">${resource.createdBy.name}</div>
            <div class="col-sm-6" style="font-size:8px"><p class="text-muted">@${resource.createdBy} </p></div>
            <g:link controller="topic" action="show" params="[topicId:resource.topic?.id]"><u>${resource.topic}</u></g:link>
        </div>

        <div class="row">
            <p>${resource.discription}</p>
        </div>

        <div class="row">
            <div class="col-sm-3">
                    <i class="fa fa-facebook-official" ></i>
                    <i class="fa fa-tumblr"></i>
                    <i class="fa fa-google-plus"></i>
            </div>

            <g:if test="${session.usser}">

            </g:if>
            <div class="col-sm-offset-9 col-sm-3">
                <g:link controller="resource" action="show" params="[id:resource?.id]"><u>View Post</u></g:link>
            </div>
        </div>
    </div>
</div>