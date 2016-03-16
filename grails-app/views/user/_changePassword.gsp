<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Change Password</h3>
    </div>
    <g:form class="form-horizontal" style="font-size:10px" controller="user" action="changePassword">
        <div style="margin:15px">
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">Password</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" placeholder="Password" name="password" id="password">
                </div>
            </div>
            <div class="form-group">
                <label for="confirmPassword" class="col-sm-2 control-label">Confirm Password</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" placeholder="confirm Password" name="confirmPassword"
                            id="confirmPassword">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-8 col-sm-10">
                    <g:submitButton class="btn btn-primary btn-sm" name="Update">Update</g:submitButton>
                </div>
            </div>
        </div>
    </g:form>
</div>