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
                <g:render template="/topic/newShow" model="[topic:topic,uniqueIdForTopicEdit:uniqueIdForTopicEdit++]"/>
            </g:each>
        </div>
</div>