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
        <g:form class="form-horizontal" controller="user" action="mailDemo">
         <p>To reset your password, enter the email address you use to sign in to Google.</p>


            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">Email Id* </label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" placeholder="Email" name="email"
                            id="email">
                </div>
            </div>

            </div>

            <div class="modal-footer">
            <g:submitButton class="btn btn-primary" name="Save">Save</g:submitButton>
            <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button></g:form>
    </div>
    </div>

</div>
