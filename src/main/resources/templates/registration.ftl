<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
Добавить нового пользователя
${message?if_exists}
<@l.login "/registration" />
</@C.page>