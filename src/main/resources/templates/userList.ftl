<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
    Список пользоателей

    <table class="table table-bordered">
        <thead>
        <tr>
            <th scope="col"> id</th>
            <th scope="col">Имя пользователя</th>
            <th scope="col"> Роли</th>
            <th scope="col"> Действия</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <th scope="row">${user.id}</th>
                <td>${user.username}</td>
                <td class="table-warning"><#list user.roles as role>${role}<#sep>, </#list></td>
                <td>
                    <button class=" btn btn-primary">
                        <a href="/user/${user.id}" style="color: white; text-decoration: none;">
                            Редактировать</a>
                    </button>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>

</@C.page>