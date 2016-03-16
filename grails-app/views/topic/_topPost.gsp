<div class="panel panel-default">
    <div class="panel-heading">
        <div class="row">
            <div class="col-sm-8"><h3 class="panel-title">Top Posts</h3></div>
        </div>
    </div>
    <div class="panel-body">
        <g:each in="${topPosts}" var="Post">
            <g:render template="/resource/newShow" model="[resource:Post]"/>
            <hr role="separator" class="divider" />
        </g:each>
    </div>
</div>