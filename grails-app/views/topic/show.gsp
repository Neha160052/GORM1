

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Topic Show</title>
</head>

<body>
<div class="container">
<div class="col-sm-5" style="margin: 10px">
    <!--Topic-->
   <g:render template="topicDetails" model="['topic':topic]"/>
    <!--End of Topic-->
    <div class="row">
         <div class="panel panel-default">
             <div class="panel-heading">
                <p class="panel-tittle">Users "${topic}"</p>
             </div>
             <div class="panel-body">
                 <g:each in="${topic.subscriptions}" var="subscription">
                     <div class="row">
                     <div class="col-sm-3">
                         <span class="glyphicon glyphicon-user" style="font-size:90px; border:1px solid"></span>
                     </div>
                     <div class="col-sm-9">
                         <h4>${subscription.user}</h4>
                         <div class="col-sm-4">
                             <p>Subscription</p>
                             <a href="#">34</a>
                         </div>
                         <div class="col-sm-4">
                             <p>Posts</p>
                             <a href="#">34</a>
                         </div>
                     </div>
                     </div>
                     <hr role="separator" class="divider" />
                 </g:each>
             </div>
         </div>
    </div>

</div>
<div class="col-sm-6">
    <g:render template="posts" model="['topic':topic]"/>
</div>

</div>
<script>
    $("#topic-post-search-button").on('click', function () {
        alert("Hello")
        var url = "/Linksharing/resource/search";
        var searchText = $("#topic-post-search-textbox").val();
        if (searchText != "") {
            var data = {topicId: $("#hidden-topic-id").val(), q: searchText};
            var success = function (result) {
                $("#post-panel-body").html(result)
            };
            $.ajax({
                url:url,
                data:data,
                success:success
            })
        }

    });
</script>
</body>
</html>