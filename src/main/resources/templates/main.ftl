<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
    <div>
        <@l.logout />
    </div>
    <div>
        <form method="post">
            <input type="text" name="nameStore"/>
            <input type="text" name="addressStore"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="submit" value="Отправить"/>
        </form>

        <div> Искать по названию склада</div>

        <form method="get" action="/main">
            <input type="text" name="nameFilter" value="${nameFilter}"/>
            <input type="submit" value="Поиск"/>
        </form>
    </div>

    <a href="/stockavailability"> Посмотреть наличие товара на складах</a>

    <div> Список сообщений</div>
    <#list stores as store>
        <div>
            <b>${store.idStore}</b>
            <b>${store.nameStore}</b>
            <b>${store.addressStore}</b>
        </div>
        <#else>
        В базе нет ни одного склада
    </#list>
</@C.page>