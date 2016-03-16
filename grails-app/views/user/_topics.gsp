<%@ page import="com.ttnd.linksharing.Visibility" %>

<div class="panel panel-default">
    <div class="panel-heading">
        <p class="panel-tittle">Topics</p>
    </div>
    <div class="panel-body">
        <g:each in="${topics}" var="topic">
           <g:render template="/topic/newShow" model="[topic:topic,uniqueIdForTopicEdit:uniqueIdForTopicEdit++]"/>
        </g:each>
    </div>
</div>
