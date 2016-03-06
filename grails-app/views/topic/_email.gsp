<%@ page import="com.ttnd.linksharing.Topic" %>

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header model-header-default">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Send Invitation</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">Email* </label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="inputEmail3" parseholder="Email" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="topics" class=" col-xs-4">Topics *</label>

                        <div class="col-xs-8">
                        <span class="dropdown" id="topics">
                            <g:select name="Topics" from="${Topic.findAll()}" class="btn btn-default dropdown-toggle" type="button"
                                      data-toggle="dropdown">Topics
                                <span class="caret"></span>
                                <ul class="dropdown-menu">

                                </ul>
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
                </form>
                <div>
                </div>
            </div>
        </div>
    </div>

