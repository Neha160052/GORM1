<div class="row">

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Register</h3>
        </div>
        <g:uploadForm class="form-horizontal" style="font-size:10px" controller="user" enctype="multipart/form-data">
            <div style="margin:15px" >
                <div class="form-group">
                    <label for="firstName" class="col-sm-2 control-label">First Name*</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="First name" name="firstName"
                               value="${registerCO?.firstName}" id="firstName">
                        <div class="alert-danger"> <g:fieldError field="firstName" bean="${registerCO}"></g:fieldError></div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="lastName" class="col-sm-2 control-label">Last Name*  </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="Last name" name="lastName"
                               value="${registerCO?.lastName}" id="lastName">
                        <div class="alert-danger"> <g:fieldError field="lastName" bean="${registerCO}"/></div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Email Id* </label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" placeholder="Email" name="email"
                               value="${registerCO?.email}" id="email">
                        <div class="alert-danger"><g:fieldError field="email" bean="${registerCO}"/></div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">Username* </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="User name" name="username"
                               value="${registerCO?.username}" id="userName">
                        <div class="alert-danger"><g:fieldError field="username" bean="${registerCO}"/></div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">Passward* </label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" placeholder="Password" name="password"
                               value="${registerCO?.password}" id="password">
                        <div class="alert-danger"><g:fieldError field="password" bean="${registerCO}"/></div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="confirmPassword" class="col-sm-2 control-label">Confirm Passward* </label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" placeholder="confirm Password" name="confirmPassword"
                               value="${registerCO?.confirmPassword}" id="confirmPassword">
                        <div class="alert-danger"><g:fieldError field="confirmPassword" bean="${registerCO}"/></div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="userPhoto" class="col-sm-2 control-label">Photo </label>
                    <div class="col-sm-10">

                            <input type="file" class="form-control" name="userPhoto" id="userPhoto">

                    </div>
                </div>

                <div class="col-sm-offset-8">
                    <g:actionSubmit class="btn btn-primary" value="Register" action="register"/>
                </div>

            </div >
        </g:uploadForm>
    </div>


</div>