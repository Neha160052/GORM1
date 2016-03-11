<%@ page import="com.ttnd.linksharing.Visibility" %>
<%@ page import="com.ttnd.linksharing.Seriousness" %>

<div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-9"> <p class="panel-tittle">Subscriptions</p></div>
                <div class="col-sm-3"><a href="#">View All</a> </div>
            </div>

         </div>
        <div class="panel-body">
            <g:each in="${subscribedTopics}" var="topic">
                <div class="row">
                    <div class="col-sm-2">
                        <span class="glyphicon glyphicon-user" style="font-size:75px; border:1px solid"></span>
                    </div>
                    <div class="col-sm-10">
                        <div class="row">
                            <div class="col-sm-offset-1">
                                <g:link controller="topic" action="show" params="[topicId:topic?.id]">${topic}</g:link>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <p class="text-muted">${topic.createdBy}</p>
                                <ls:showSubscribe topicId="${topic.id}">
                                </ls:showSubscribe>
                            </div>
                            <div class="col-sm-4">
                                <p class="text-muted">subscriptions</p>
                                <a href="#">34</a>
                            </div>
                            <div class="col-sm-4">
                                <p class="text-muted">Posts </p>
                                <a href="#">34</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <g:select name="visibility" from="${Visibility.values()}"
                                          class="btn btn-default dropdown-toggle" type="button"
                                          data-toggle="dropdown">
                                </g:select>
                            </div>
                            <div class="col-sm-5">
                                <g:select name="visibility" from="${Seriousness.values()}"
                                          class="btn btn-default dropdown-toggle" type="button"
                                          data-toggle="dropdown">
                                </g:select>
                            </div>
                            <div class="col-sm-4">

                                <i class="fa fa-envelope-o" style="font-size:25px"></i >
                                <i class="fa fa-pencil-square-o" style="font-size:25px"></i>
                                <i class="glyphicon glyphicon-trash" style="font-size:25px"></i>

                            </div>
                        </div>
                    </div>
                </div>
                <hr role="separator" class="divider" />
                <div class="row">
                    <div class="col-sm-2">
                        <span class="glyphicon glyphicon-user" style="font-size:75px; border:1px solid"></span>
                    </div>
                    <div class="col-sm-10">
                        <div class="row">
                            <div class="col-sm-offset-1">
                                <a href="#"><u>${topic}</u></a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <p class="text-muted">${topic.createdBy}</p>
                                <ls:showSubscribe topicId="${topic.id}">
                                </ls:showSubscribe>
                            </div>
                            <div class="col-sm-4">
                                <p class="text-muted">subscriptions</p>
                                <a href="#">34</a>
                            </div>
                            <div class="col-sm-4">
                                <p class="text-muted">Posts </p>
                                <a href="#">34</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-offset-5 col-sm-5">
                                <g:select name="visibility" from="${Seriousness.values()}"
                                          class="btn btn-default dropdown-toggle" type="button"
                                          data-toggle="dropdown">
                                </g:select>
                            </div>
                            <div class="col-sm-2">
                                <i class="fa fa-envelope-o" style="font-size:25px"></i >
                            </div>
                        </div>
                    </div>
                </div>
                <hr role="separator" class="divider" />
            </g:each>
        </div>
</div>