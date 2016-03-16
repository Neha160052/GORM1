<div class="panel panel-default" style="margin:15px">
    <div class="panel-body">
        <div class="row">
            <div class="col-sm-4">
                <span class="glyphicon glyphicon-user" style="font-size:90px; border:1px solid"></span>
            </div>
            <div class="col-sm-8">
                <div class="row">
                    <h4>${user.name}</h4>
                    <p class="text-muted">@${user}</p>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <p class="text-muted">subscriptions</p>
                        <ls:subscriptionCount userId="${user.id}"></ls:subscriptionCount>
                    </div>
                    <div class="col-sm-6">
                        <p class="text-muted">Topics </p>
                        %{--<ls:userTopics></ls:userTopics>--}%
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>