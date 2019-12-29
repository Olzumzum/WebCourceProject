<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
    <div class="content col align-self-center">
        <div class="md-1 mb-3">
            Авторизация
        </div>
        <@l.login "/login" false/>
    </div>
</@C.page>
