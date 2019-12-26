<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
Список пользоателей

    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th>Role</th>
        </tr>
        </thead>
    </table>
    <tbody>
<#list users as user>
    <tr>
        <td>${user.username}</td>
        <td><#list user.roles as role>${role}<#sep>, </#list></td>
        <td><a href="/user/${user.id}"> Редактировать</a> </td>
    </tr>
</#list>
    </tbody>
</@C.page>