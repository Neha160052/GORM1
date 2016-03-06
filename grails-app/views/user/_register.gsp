<div class="row">

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Register</h3>
        </div>
        <g:form class="form-horizontal" style="font-size:10px" action="register">
            <div style="margin:15px" >
                <div class="form-group">
                    <label for="firstName" class="col-sm-2 control-label">First Name*</label>
                    <div class="col-sm-10">
                        <g:textField class="form-control" name="firstName"></g:textField>
                    </div>
                </div>

                <div class="form-group">
                    <label for="lastName" class="col-sm-2 control-label">Last Name*  </label>
                    <div class="col-sm-10">
                        <g:textField class="form-control" name="lastName"></g:textField>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Email Id* </label>
                    <div class="col-sm-10">
                        <g:textField class="form-control" name="email"></g:textField>
                    </div>
                </div>

                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">Username* </label>
                    <div class="col-sm-10">
                        <g:textField class="form-control" name="username"></g:textField>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">Passward* </label>
                    <div class="col-sm-10">
                        <g:passwordField class="form-control" name="password"></g:passwordField>
                    </div>
                </div>

                <div class="form-group">
                    <label for="confirmPassword" class="col-sm-2 control-label">Confirm Passward* </label>
                    <div class="col-sm-10">
                        <g:passwordField class="form-control" name="confirmPassword"></g:passwordField>
                    </div>
                </div>

                <div class="form-group">
                    <label for="photo" class="col-sm-2 control-label">Photo </label>
                    <div class="col-sm-10">
                        <div class="col-sm-6">
                            <g:textField class="form-control" name="photo"></g:textField>
                        </div>
                        <div class="col-sm-6">
                            <button type="submit" class="btn btn-primary">Browse</button>
                        </div>
                    </div>
                </div>

                <div class="col-sm-offset-8">
                    <g:submitButton class="btn btn-primary" name="Register">Register</g:submitButton>
                </div>

            </div >
        </g:form>
    </div>


</div>