<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg" style="background-color: #61F013;">

    <a href="/" class="navbar-brand">
        <img src="static/icon.png" alt="Магазин игрушек" class="navbar-toggler-icon">
        <span id="nameSite" class="title_menu_icon" class="navbar-toggler" data-toggle="collapse"
              data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
              aria-expanded="false" aria-label="Toggle navigation">MyToys</span>
    </a>

    <div class="navig collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a id="home_item_nav" href="/" class="nav-link" style="color: yellow"> Home </a>
            </li>

            <#if isAdmin>
                <li class="nav-item"><a href="/user" class="nav-link"> Информация о пользователях</a></li>
                <li class="nav-item"><a href="/suppliercompany" class="nav-link"> Поставщики </a></li>
                <li class="nav-item"><a href="/itemproducts" class="nav-link"> Продукция </a></li>
            </#if>
            <#if isUser>
                <li class="nav-item"><a href="/itemproducts" class="nav-link"> Продукция </a></li>
                <li class="nav-item"><a href="/itemsale" class="nav-link"> Продажи </a></li>
                <li class="nav-item"><a href="/stockavailability" class="nav-link"> Товар на складе </a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="/ordersList" role="button"
                       aria-haspopup="true"
                       aria-expanded="false"> Заказы </a>

                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="/order"> Добавить заказ </a>
                        <a class="dropdown-item" href="/ordersList"> Все заказы </a>
                    </div>
                </li>
            </#if>
        </ul>
    </div>

    <div class="form-group row mt-1 mr-4">
        <div class="navbar-text mr-2">${name}</div>
        <@l.logout />
    </div>
</nav>
