<%@ page import="com.ttnd.linksharing.Seriousness" %>

<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Topic "${topic.name}"</h3>
        </div>
        <div class="panel-body">
            <div class="col-sm-3">
                <span class="glyphicon glyphicon-user" style="font-size:90px; border:1px solid"></span>
            </div>
            <div class="col-sm-9">
                <div class="row">
                    <p>${topic.name}(${topic.visibility})</p>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <p>${topic.createdBy}</p>
                        <a href="#" ><u>Subscribe</u></a>
                    </div>
                    <div class="col-sm-4">
                        <p>Subscription</p>
                        <a href="#">34</a>
                    </div>
                    <div class="col-sm-4">
                        <p>Posts</p>
                        <a href="#">34</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-offset-2 col-sm-10">
                        <span>
                        <g:select name="visibility" from="${Seriousness.values()}"
                                  class="btn btn-default dropdown-toggle" type="button"
                                  data-toggle="dropdown">
                        </g:select>
                        </span>
                        <span><i class="fa fa-envelope-o" style="font-size:30px"></i ></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>