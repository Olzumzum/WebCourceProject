<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
    <div class="md-1 mb-3">
        Добавить нового пользователя
    </div>
    ${message?if_exists}
    <@l.login "/registration" true/>
</@C.page>