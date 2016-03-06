<%@ page import="com.ttnd.linksharing.Visibility" %>
<!-- Modal1 -->

<div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Change Password</h4>
        </div>

    <div class="modal-body">
        <g:form class="form-horizontal" controller="user" action="forgetPassword">
            <div class="form-group">
                <label for="password" class=" col-xs-4">Password</label>

                <div class="col-xs-8">
                    <g:textField class="form-control" name="password"></g:textField>
                </div>
            </div>

            <div class="form-group">
                <label for="newPassword" class=" col-xs-4">New Password</label>

                <div class="col-xs-8">
                    <g:textField class="form-control" name="newPassword"></g:textField>
                </div>
            </div>

            <div class="form-group">
                <label for="confirmPassword" class=" col-xs-4">ConfirmPasswordPassword</label>

                <div class="col-xs-8">
                    <g:textField class="form-control" name="confirmPassword"></g:textField>
                </div>
            </div>


            </div>

            <div class="modal-footer">
            <g:submitButton class="btn btn-primary" name="Save">Save</g:submitButton>
            <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button></g:form>
    </div>
    </div>

</div>
