
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Pagination</title>
</head>

<body>
<table border="1">
    <th>id </th>
    <th>Name </th>

    <g:each in="${userList}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            %{--<td>${user.lastName}</td>--}%
        </tr>
    </g:each>

</table>


<div id ="userTable_PaginateDiv" class="pagination">
    <g:paginate maxsteps="5" total="${userCount}" controller="user" action="showPaginatedData" />
</div>
</html>