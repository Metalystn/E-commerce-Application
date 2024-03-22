<!DOCTYPE html>
<html>
<head>
    <title>Shop</title>
</head>
<body>
<h1>Shop</h1><hr>
<h4>Admin Page</h4>

<table border="1">
    <tr>
        <th>Email</th>
        <th>Phone Number</th>
        <th>Activity</th>
        <th>Roles</th>
        <th>Ban</th>
        <th>Detailed</th>
        <th>Delete</th>
    </tr>
    <#list users as user>
        <tr>
            <th>${user.email}</th>
            <th>${user.phoneNumber}</th>
            <th><#if user.active>true<#else>false</#if></th>
            <th><#list user.roles as role>${role}<#sep>, </#list> </th>
            <th><form action="admin/user/ban/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Ban">
                </form>
            </th>
            <th><a href="/user/${user.id}">Detailed</a></th>
            <th><form action="/admin/user/delete/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Delete">
                </form>
            </th>
        </tr>
        <#else>
            <h3>No users</h3>
    </#list>

</table>

</body>
</html>