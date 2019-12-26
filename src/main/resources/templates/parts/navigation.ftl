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
            <li><a href="/main" class="item_nav"> Информация о складах</a></li>
        </ul>

        <ul>
            <#if isAdmin>
                <li><a href="/user" class="item_nav"> Информация о пользователях</a></li>
            </#if>
        </ul>
    </div>

    <div class="login_in_nav">
        <div class="login_nav_username">${name}</div>
        <@l.logout />
    </div>
</nav>
