<#macro page>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="../static/main_style.css">
        <link rel="stylesheet" href="../static/nav_main_style.css">
        <link rel="stylesheet" href="static/authorization.css">
        <link rel="stylesheet" href="static/search_product.css">
        <link rel="stylesheet" href="static/add_product.css">
        <link rel="stylesheet" href="static/products.css">
        <link rel="stylesheet" href="static/supplier_company.css">
        <title>Title</title>
    </head>
    <body>
    <#include "navigation.ftl">
    <#nested>
    </body>
    </html>
</#macro>