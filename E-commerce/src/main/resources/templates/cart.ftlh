<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
</head>
<body>
<h1>Cart</h1>
<hr>
<table>
    <thead>
    <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Price</th>
        <th>City</th>
        <th>Action</th>
        <th>Purchase</th>
    </tr>
    </thead>
    <tbody>
    <#if cart??>
        <#list cart.products as product>
            <tr>
                <td>${product.title}</td>
                <td>${product.description}</td>
                <td>${product.price}</td>
                <td>${product.city}</td>
                <td>
                    <form method="post" action="/cart/${product.id}/remove">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <button type="submit">Remove</button>
                    </form>
                </td>
                <td>
                    <form method="post" action="/cart/buy">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <button type="submit">Purchase</button>
                    </form>
                </td>
            </tr>
        </#list>
    <#else>
        <tr>
            <td colspan="5" class="empty-cart">Cart is empty or not available.</td>
        </tr>
    </#if>
    </tbody>
</table>
</body>
</html>
