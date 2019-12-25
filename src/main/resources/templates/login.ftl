<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
Авторизация
<@l.login "/login" />
<a href="/registration">Регистрация</a>
</@C.page>
