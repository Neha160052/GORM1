<%@ page import="com.ttnd.linksharing.Topic" %>

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header model-header-default">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Send Invitation</h4>
            </div>
            <div class="modal-body">

                <g:form class="form-horizontal">
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email* </label>
                        <div class="col-sm-10">
                            <g:textField class="form-control" name="email"></g:textField>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="topics" class=" col-xs-4">Topics *</label>

                        <div class="col-xs-8">
                        <span class="dropdown" id="topics">
                            <g:select name="topic" from="${session.user.getSubscribedTopics()}"
                                      class="btn btn-default dropdown-toggle" type="button"
                                      data-toggle="dropdown">
                            </g:select>
                        </span>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-6 col-sm-2">
                            <button class="btn btn-primary btn-sm">Invite</button>
                        </div>
                        <div class="col-sm-2">
                            <button class="btn btn-primary btn-sm">Cancle</button>
                        </div>
                    </div>
                        </g:form>

                <div>
                </div>
            </div>
        </div>
    </div>

