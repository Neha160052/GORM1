<div class="row">
    <div class="col-sm-2">
        <span class="glyphicon glyphicon-user" style="font-size:75px; border:1px solid"></span>
    </div>
    <div class="col-sm-10">
        <div class="row">
            <div class="col-sm-offset-1" id="topic-edit-${uniqueIdForTopicEdit}" style="display: none">
                <g:form class="form-inline" controller="topic" role="form">
                    <div class="form-group">
                        <input type="hidden" id="topic-hidden-user-id-${uniqueIdForTopicEdit}"
                               value="${topic?.createdBy}"/>
                        <input type="hidden" id="topic-hidden-topic-id-${uniqueIdForTopicEdit}"
                               value="${topic?.id}"/>
                        <input type="text" class="form-control col-sm-10"
                               id="topic-name-edit-textbox-${uniqueIdForTopicEdit}">
                        <button type="button" class="btn btn-primary"
                                onclick="updateTopic(${uniqueIdForTopicEdit})">save</button>
                        <button type="button" class="btn btn-default"
                                onclick="toggleTopicEditName(${uniqueIdForTopicEdit})">cancel</button>
                    </div>
                </g:form>
            </div>
            <div class="col-sm-offset-1">
            <g:link name="topicName" controller="topic" action="show"
                    params='[topicId: "${topic?.id}"]'>
                <div class="row" id="topic-name-${uniqueIdForTopicEdit}">
                    ${topic?.name}
                </div>
            </g:link>
            </div>
            </br>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <g:link controller="user" action="profile" params="[userId:topic.createdBy]" class="text-muted">${topic.createdBy}</g:link>
                <g:if test="${session.user}">
                <ls:showSubscribe topicId="${topic.id}">
                </ls:showSubscribe>
                </g:if>
            </div>
            <div class="col-sm-4">
                <p class="text-muted">subscribers</p>
                <ls:topicSubscriber topicId="${topic?.id}"/>
            </div>
            <div class="col-sm-4">
                <p class="text-muted">Posts </p>
                <ls:topicResources topicId="${topic?.id}"></ls:topicResources>
            </div>
        </div>
    </br>
        <div class="row">
            <div class="col-sm-4">
                <ls:showSeriousness topicId="${topic?.id}" class="btn btn-default seriousness" id="seriousness"/>
            </div>
            <ls:canUpdateTopic topicId="${topic?.id}" currentUser="${session.user}">
                <div class="col-sm-4">
                    <ls:showVisibility topicName="${topic?.name}" id="visibility" visibility="${topic?.visibility}"
                                       class="btn btn-default visibility" topicId = "${topic?.id}"/>
                </div>
                <i class="fa fa-pencil-square-o" style="font-size:25px;color: #337ab7;"
                   onclick="toggleTopicEditName(${uniqueIdForTopicEdit})"></i>
                <g:link  controller="topic" action="delete" class="glyphicon glyphicon-trash" style="font-size:25px;color: #337ab7" id="deleteTopic" params="[topicId:topic?.id]"></g:link>
            </ls:canUpdateTopic>
            <ls:showInvitation class="fa fa-envelope-o"  topicId="${topic?.id}" title="Invite friends"/>

        </div>
    </div>
</div>
<hr role="separator" class="divider" />
<p style="display: none">${uniqueIdForTopicEdit++}</p>