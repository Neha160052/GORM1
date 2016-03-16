<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>


<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header model-header-default">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Share Document</h4>
        </div>
        <div class="modal-body">
            <g:uploadForm class="form-horizontal" controller="documentResource">

                <div class="form-group">
                    <label for="file" class="col-sm-2 control-label">Document* </label>
                    <div class="col-sm-10">
                            <input type="file" class="form-control" name="file">
                    </div>
                </div>

                <div class="form-group">
                    <label for="discription" class="col-sm-2 control-label">Discription* </label>
                    <div class="col-sm-10">
                        <g:textArea class="form-control" name="discription"></g:textArea>
                    </div>
                </div>

                <div class="form-group">
                    <label for="topic" class="col-sm-2 control-label">Topic* </label>
                    <div class="col-sm-10">
                        <g:select name="topic" from="${session.user.getSubscribedTopics()}"
                                  class="btn btn-default dropdown-toggle" type="button"
                                  data-toggle="dropdown">
                        </g:select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-6 col-sm-2">
                        <g:actionSubmit class="btn btn-primary" value="Share" action="upload"/>
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </g:uploadForm>
        </div>
    </div>
</div>

</body>
</html>>