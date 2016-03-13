<%@ page import="com.ttnd.linksharing.Topic" %>

<<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header model-header-default">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Share Link</h4>
        </div>
        <div class="modal-body">
            <g:form class="form-horizontal" controller="linkResource" action="saveLinkResource">

                <div class="form-group">
                    <label for="url" class="col-sm-2 control-label">link* </label>
                    <div class="col-sm-10">
                        <div class="col-sm-6">
                            <g:textField class="form-control" name="url"></g:textField>
                        </div>
                        <div class="col-sm-6">
                            <button type="submit" class="btn btn-primary">Browse</button>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="discription" class="col-sm-2 control-label">Discription* </label>
                    <div class="col-sm-10">
                        <g:textField class="form-control" name="discription"></g:textField>
                    </div>
                </div>

                <div class="form-group">
                    <label for="topicName" class="col-sm-2 control-label">Topic* </label>
                    <div class="col-sm-10">
                        <g:select name="topicName" from="${Topic.list()}" value=""
                                  class="btn btn-default dropdown-toggle" type="button"
                                  data-toggle="dropdown">

                        </g:select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-6 col-sm-2">
                        <g:submitButton class="btn btn-primary" name="Save">Save</g:submitButton>
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">Cancel</button>
                    </div>
                </div>

            </g:form>
        </div>
    </div>
</div>