
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header model-header-default">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Send Invitation</h4>
        </div>
        <div class="modal-body">

            <g:form class="form-horizontal" controller="User">
                <div class="form-group">
                <label for="email" class="col-sm-offset-1 control-label">Send invitation for ${topicName}</label>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Email* </label>
                    <div class="col-sm-10">
                        <g:textField class="form-control" name="email"></g:textField>
                        <input type="hidden" value="${topicName}"/>
                    </div>
                </div>



                <div class="form-group">
                    <div class="col-sm-offset-6 col-sm-2">
                        %{--<button class="btn btn-primary btn-sm">Invite</button>--}%
                        <g:actionSubmit class="btn btn-primary btn-sm" value="Invite" action="sendInvitation"/>
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </g:form>

            <div>
            </div>
        </div>
    </div>
</div>

