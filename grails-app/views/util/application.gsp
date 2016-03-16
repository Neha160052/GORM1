<html>
<head>
<meta name="layout" content="main"/>
</head>
<body>
<g:render template="/topic/dummy"/>
<ls:isRead resourceId="1">

</ls:isRead>

<ls:resourceCount topicId="3">

</ls:resourceCount>
<ls:topicCount userId="2">

</ls:topicCount>
<ls:subscriptionCount userId="2" topicId="4">

</ls:subscriptionCount>
<g:link controller="documentResource" action="download">hello</g:link>
<ls:canDeleteResource resourceId="4">

</ls:canDeleteResource>
<script>
    function toggleTopicEditName(){
        var div = document.getElementById('demoId');

        if (!div.style.display || div.style.display === 'block') div.style.display = 'none';
        else div.style.display = 'block';
    }
</script>
</body>
</html>