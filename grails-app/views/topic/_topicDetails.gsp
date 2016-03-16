<%@ page import="com.ttnd.linksharing.Seriousness" %>

<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Topic "${topic.name}"</h3>
        </div>
        <div class="panel-body">
             <g:render template="/topic/newShow" model="[topic:topic,uniqueIdForTopicEdit:1]"/>
         </div>
    </div>
</div>