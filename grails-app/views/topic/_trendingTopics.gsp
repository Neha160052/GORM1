
<div class="row" style="margin: 25px">
    <div class="panel panel-default">
        <div class="panel-heading">
            <p class="panel-tittle">Trending Topics</p>
        </div>
        <div class="panel-body">
            <g:each in="${trendingTopics}" var="topic">
                <g:render template="/topic/newShow" model="[topic:topic,uniqueIdForTopicEdit:uniqueIdForTopicEdit++]"/>
            </g:each>
        </div>
    </div>
</div>