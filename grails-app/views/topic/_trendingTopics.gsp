<%@ page import="com.ttnd.linksharing.Visibility" %>
<%@ page import="com.ttnd.linksharing.Seriousness" %>
<div class="row" style="margin: 15px">
    <div class="panel panel-default">
        <div class="panel-heading">
            <p class="panel-tittle">Topics</p>
        </div>
        <div class="panel-body">
            <g:each in="${trendingTopics}" var="trendingTopic">
            <div class="row">

                    <div class="col-sm-3">
                        <span class="glyphicon glyphicon-user" style="font-size:90px; border:1px solid"></span>
                    </div>
                    <div class="col-sm-9">
                        <div class="row">
                            <h4>${trendingTopic.name}</h4>
                            <p class="text-muted">${trendingTopic.createdBy}</p>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <p class="text-muted">subscriptions</p>
                                <a href="#">34</a>
                            </div>
                            <div class="col-sm-6">
                                <p class="text-muted">Posts </p>
                                <a href="#">${trendingTopic.count}</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
                <hr role="separator" class="divider" />

                <div class="row" style="margin:10px">
                <div class="col-sm-2">
                    <i class="glyphicon glyphicon-user" style="border:1px solid;font-size:70px"></i>
                </div>
                <div class="col-sm-10">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="passward" class="form-control" id="inputEmail3">
                            </div>
                            <div class="col-sm-6">
                                <button type="submit" class="btn btn-primary">Save</button>
                                <button type="submit" class="btn btn-primary">Cancle</button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <p class="text-muted">${trendingTopic.createdBy}</p>
                            <a href="#"><u>Unsubscribe</u></a>
                        </div>
                        <div class="col-sm-4">
                            <p class="text-muted">subscribers</p>
                            <a href="#">34</a>
                        </div>
                        <div class="col-sm-4">
                            <p class="text-muted">Posts </p>
                            <a href="#">${trendingTopic.count}</a>
                        </div>
                    </div>

                <div class="row">
                    <div class="col-sm-3">
                        <g:select name="visibility" from="${Visibility.values()}"
                                  class="btn btn-default dropdown-toggle" type="button"
                                  data-toggle="dropdown">
                        </g:select>
                    </div>
                    <div class="col-sm-4">
                        <g:select name="visibility" from="${Seriousness.values()}"
                                  class="btn btn-default dropdown-toggle" type="button"
                                  data-toggle="dropdown">
                        </g:select>
                    </div>
                    <div class="col-sm-5">

                            <i class="fa fa-envelope-o" style="font-size:30px"></i >
                            <i class="fa fa-pencil-square-o" style="font-size:30px"></i>
                            <i class="glyphicon glyphicon-trash" style="font-size:30px"></i>

                    </div>
                </div>
                <hr role="separator" class="divider" />
            </div>
                    <hr role="separator" class="divider" />
                <hr role="separator" class="divider" />
                    </g:each>
        </div>
    </div>
</div>