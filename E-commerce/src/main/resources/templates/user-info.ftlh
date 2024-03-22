<!DOCTYPE html>
<html>
<head>
    <title>Shop</title>
</head>
<body>
<h1>Shop</h1><hr>
<h3>More about: ${user.name}</h3>
<b>Phone number:</b> ${user.phoneNumber}
<b>Email:</b> ${user.email}

<h4>Products of ${user.name}</h4>
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} $ | <a href="/product/${product.id}">See more...</a></p>
    </div>
    <#else>
    <h3>No result</h3>
</#list>

<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
</body>
</html>