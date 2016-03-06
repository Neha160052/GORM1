<div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Login</h3>
                </div>

<g:form class="form-horizontal" style="font-size:10px" action="loginHandler" method="POST">
    <div style="margin:15px">
        <div class="form-group">
            <label for="username" class="col-sm-2 control-label">Email/ Username* </label>
            <div class="col-sm-10">
                <g:textField class="form-control" name="username"></g:textField>
            </div>

            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">Password</label>
                <div class="col-sm-10">
                    <g:passwordField class="form-control" name="password"></g:passwordField>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-4">
                    <a data-toggle="modal" data-target="#cfModal" href="#">Forget Password</a>
                </div>
                <div class="col-sm-offset-8 col-sm-10">
                    <g:submitButton class="btn btn-primary" name="Login"></g:submitButton>
                </div>

            </div>
        </div>
    </div >
</g:form>
<div id="cfModal" class="modal fade">
    <g:render template="/user/forgetPassword" />
</div>
</div>