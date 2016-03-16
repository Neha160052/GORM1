<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Recent Shares</h3>
        </div>

        <div class="panel-body">
            <g:each in="${recentResources}" var="recentResource">
                <g:render template="/resource/newShow" model="[resource:recentResource]"/>
                <hr role="separator" class="divider" />
            </g:each>
        </div>

    </div>
</div>