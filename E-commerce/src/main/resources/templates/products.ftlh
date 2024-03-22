<!DOCTYPE html>
<html>
<head>
    <title>Shop</title>
</head>
<body>
<h1>Shop</h1><hr>
<#if user.email??>
    <h3>User: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Log out"/>
    </form>
    <#if user.isAdmin()>
        <a href="/admin">Admin Settings</a>
    </#if>
<#else>
    <a href="/login">Login</a></h1>
</#if>
<hr>
<h4>Products</h4>


<form action="/cart" method="get">
    <input type="submit" value="Shopping Cart"/>
</form>
<br>

<form action="/" method="get">
    Search <input type="text" name="title">
    <input type="submit" value="Search"/>
</form>
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} $ | <a href="/product/${product.id}">See more...</a></p>
    </div>
<#else>
    <h3>No result</h3>
</#list>
<#if user.email??>
    <hr>
    <h3>Add product</h3>
    <form action="/product/create" method="post" enctype="multipart/form-data">
        Name of the Product: <input type="text" name="title"/><br><br>
        Description: <input type="text" name="description"/><br><br>
        Price: <input type="number" name="price"/><br><br>
        City: <input type="text" name="city"/><br><br>
        First photo: <input type="file" name="file1"/><br><br>
        Second photo: <input type="file" name="file2"/><br><br>
        Third photo: <input type="file" name="file3"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Add product"/>
    </form>
</#if>
</body>
</html>