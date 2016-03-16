<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Users</title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="panel panel-default">
    <div class="panel-heading">
        <div class="row">
            <div class="col-md-7">
                Users
            </div>
            <g:form controller="user" action="list">
                <div class="col-md-2">
                    <select class="btn btn-default" name="active">
                        <option value="null">All user</option>
                        <option value="true">Active</option>
                        <option value="false">In active</option>

                    </select>
                </div>

                <div class="col-sm-3">
                    <section id="search">
                        <label>
                            <i class="fa fa-search"></i>
                        </label>
                        <input type="text" placeholder="Search">
                    </section>
                    %{--<div id="custom-search-input" style="margin: 1px;">--}%
                        %{--<div class="input-group col-md-12">--}%
                            %{--<input type="text" id="topic-post-search-textbox" name="q" class="form-control input-lg"--}%
                                   %{--placeholder="Search.." value="${userSearchCO?.q}"/>--}%
                            %{--<span class="input-group-btn">--}%
                                %{--<button class="btn btn-info btn-lg" type="submit">--}%
                                    %{--<i class="glyphicon glyphicon-search"></i>--}%
                                %{--</button>--}%
                                %{--<button class="btn btn-info btn-lg" id="topic-post-search-clear-button" type="button">--}%
                                    %{--<i class="glyphicon glyphicon-remove"></i>--}%
                                %{--</button>--}%
                            %{--</span>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                </div>
            </g:form>
        </div>
    </div>

    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-condensed table-hover">
                <thead>
                <tr>
                    <g:sortableColumn property="id" title="Id"
                                      params="[q: userSearchCO?.q, max: userSearchCO.max, offset: userSearchCO.offset]"/>
                    <g:sortableColumn property="username" title="User name"
                                      params="[q: userSearchCO?.q, max: userSearchCO.max, offset: userSearchCO.offset]"/>
                    <g:sortableColumn property="email" title="Email"
                                      params="[q: userSearchCO?.q, max: userSearchCO.max, offset: userSearchCO.offset]"/>
                    <g:sortableColumn property="firstName" title="First name"
                                      params="[q: userSearchCO?.q, max: userSearchCO.max, offset: userSearchCO.offset]"/>
                    <g:sortableColumn property="lastName" title="Last name"
                                      params="[q: userSearchCO?.q, max: userSearchCO.max, offset: userSearchCO.offset]"/>
                    <g:sortableColumn property="active" title="Active"
                                      params="[q: userSearchCO?.q, max: userSearchCO.max, offset: userSearchCO.offset]"/>
                    <th>Manage</th>
                </tr>
                </thead>
                <g:each in="${users}" var="user">
                    <g:if test="${user.active}">
                        <g:set var="bootstrapAlertClass" value="alert alert-success"/>
                    </g:if>
                    <g:else>
                        <g:set var="bootstrapAlertClass" value="alert alert-danger"/>
                    </g:else>

                    <tr class="${bootstrapAlertClass}">
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.active}</td>
                        <td>
                            <g:if test="${user.active}">
                                <g:link controller="user" action="toggleActive"
                                        params='[id: "${user.id}"]'>De-activate</g:link>
                            </g:if>
                            <g:else>
                                <g:link controller="user" action="toggleActive"
                                        params='[id: "${user.id}"]'>Activate</g:link>
                            </g:else>
                        </td>
                    </tr>
                </g:each>
            </table>
            <ul class="pagination pull-right">
                <g:paginate total="${totalCount}" max="${userSearchCO?.max}" offset="${userSearchCO?.offset}"/>
            </ul>
        </div>
    </div>
</div>
</body>
</html>