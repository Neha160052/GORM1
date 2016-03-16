<%@ page import="com.ttnd.linksharing.Visibility" %>
<!-- Modal1 -->
<div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Edit Topic</h4>
        </div>
    <div class="modal-body">
        <g:form class="form-horizontal" controller="topic" action="edit" params="[id:topicId]">
            <div class="form-group">
                <label for="topicName" class=" col-xs-4">Name *</label>
                <div class="col-xs-8">
                    <g:textField class="form-control" name="topicName" value="${topicName}"
                                 placeholder="Name"></g:textField>
                </div>
            </div>
            <div class="form-group">
                <label for="inputVisibility" class=" col-xs-4">Visibility *</label>

                <div class="col-xs-8">
                    <span class="dropdown" id="inputVisibility">
                        <g:select name="visibility" from="${Visibility.values()}" value="${TopicVisibility}"
                                  class="btn btn-default dropdown-toggle" type="button"
                                  data-toggle="dropdown">
                        </g:select>
                    </span>
                </div>
            </div>
            </div>
            <div class="modal-footer">
            <g:submitButton class="btn btn-primary" name="Save">Save</g:submitButton>
            <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
        </g:form>
    </div>
    </div>
</div>
