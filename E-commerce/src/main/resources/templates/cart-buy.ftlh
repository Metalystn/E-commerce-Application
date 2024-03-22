<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchase</title>
</head>
<body>
<h1>Purchase</h1>
<hr>
<h4>Products</h4>
<#list product as p>
    <b>Name: </b>${p.title}<br>
    <b>Description: </b>${p.description}<br>
    <b>Price: </b>${p.price}<br>
    <b>City: </b>${p.city}<br>
    <b>Seller: </b> <a href="/user/${p.user.id}">${p.user.name}</a><br>
    <hr>
</#list>
<b>Total Price: </b>${totalPrice}
</body>
</html>
