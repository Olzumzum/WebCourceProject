<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>

    <form action="/user" method="post">
        <input type="text" name="username" value="${user.username}">
        <#list roles as role>
            <div>
               <label>
                   <input type="checkbox" name="${role}"
                           ${user.roles?seq_contains(role)?string("checked", "")}>
                   ${role} </label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="Сохранить">
    </form>
</@C.page>