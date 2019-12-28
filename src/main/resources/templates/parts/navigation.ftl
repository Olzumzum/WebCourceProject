<#include "security.ftl">
<#import "login.ftl" as l>

<nav>
    <div class="icon_block">
        <a href="/">
            <img src="static/icon.png" alt="Магазин игрушек" class="img_icon_main">
            <span class="title_menu_icon">MyToys</span>
        </a>
    </div>

    <div class="top_menu">
        <ul>
            <li><a href="/" class="item_nav"> Home </a></li>
        </ul>

        <ul>
            <#if isAdmin>
                <li><a href="/user" class="item_nav"> Информация о пользователях</a></li>
                <li><a href="/suppliercompany" class="item_nav"> Добавить поставщика </a></li>
                <li><a href="/itemproducts" class="item_nav"> Продукция </a></li>
            </#if>
            <#if isUser>
                <li><a href="/itemproducts" class="item_nav"> Продукция </a></li>
                <li><a href="/stores" class="item_nav"> Склады </a></li>
                <li><a href="/itemsale" class="item_nav"> Продажи </a></li>
            </#if>
        </ul>
    </div>

    <div class="login_in_nav">
        <div class="login_nav_username">${name}</div>
        <@l.logout />
    </div>
</nav>
