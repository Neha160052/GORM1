

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>User's Details</title>
</head>

<body>
<g:if test="${session.user.admin}">
    <div class="container">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>username</th>
                <th>Email</th>
                <th>Firstname</th>
                <th>Lastname</th>
                <th>Active</th>
                <th>Manage</th>
            </tr>
            </thead>
            <tbody>
               <g:each in="${users}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.active}</td>
                        <td><ls:isActive isActive="${user.active}" userId="${user.id}"/></td>
                    </tr>
               </g:each>
            </tbody>
        </table>
    </div>
</g:if>
<g:else>
    <p>Only admin can use this page</p>
</g:else>

</body>
</html>