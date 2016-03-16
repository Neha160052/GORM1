<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Profile</h3>
    </div>
<g:uploadForm class="form-horizontal" style="font-size:10px" controller="user" action="updateProfile" enctype="multipart/form-data">
        <div style="margin:15px" >
            <div class="form-group">
                <label for="firstName" class="col-sm-2 control-label">First Name*</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="First name" name="firstName"
                           value="${session.user.firstName}" id="firstName">
                </div>
            </div>
            <div class="form-group">
                <label for="lastName" class="col-sm-2 control-label">Last Name*  </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="Last Name" name="lastName"
                           value="${session.user.lastName}" id="lastName">
                </div>
            </div>
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">Username* </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="User name" name="username"
                           value="${session.user.username}" id="username">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Photo </label>
                <div class="col-sm-10">
                    <div class="col-sm-6">
                        <input type="passward" class="form-control" id="inputEmail3">
                    </div>
                    <div class="col-sm-6">
                        <button type="submit" class="btn btn-primary">Browse</button>
                    </div>
                </div>
            </div>
            <div class="col-sm-offset-8">
                <g:submitButton class="btn btn-primary" name="Update"></g:submitButton>
            </div>
        </div >
    </g:uploadForm>
</div>