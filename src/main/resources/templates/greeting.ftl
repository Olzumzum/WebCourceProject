<#import "parts/common.ftl" as C>
<#include "parts/security.ftl">

<@C.page>
    <div class="col-sm"/>
    <div class="col-sm">
        <div class="mb-3 mt-2">Система администрирования сети магазинов MyToys</div>
        <div class="mt-3 mb-5">
            <img src="static/icon.png" style="width: 200px; height: 200px">
        </div>
        <#if !isAdmin || !isUser>
            <div>
                <a href="/login"> Авторизуйтесь, чтобы войти в систему</a>
            </div>
        </#if>
    </div>
    <div class="col-sm"/>
</@C.page>
