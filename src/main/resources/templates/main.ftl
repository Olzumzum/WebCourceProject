<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
    <div>
        <div> Искать по названию склада</div>
        <form method="get" action="/main">
            <input type="text" name="nameFilter" value="${nameFilter?if_exists}"/>
            <input type="submit" value="Поиск"/>
        </form>
    </div>

    <div>
        <div>
            <div> Добавить продукт</div>
            <form method="post" enctype="multipart/form-data">
                <div>
                    <label> Название продукта </label>
                    <input type="text" name="nameStore"/>
                </div>
                <div>
                    <label> В данном случае адресс</label>
                    <input type="text" name="addressStore"/>
                </div>
                <div >
                    <label> Изображение</label>
                    <input type="file" name="file"/>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="submit" value="Отправить"/>
            </form>
        </div>

        <div>
            <div> Список складов</div>
            <#list stores as store>
                <#if store.idStore % 2 == 0>
                    <span style="visibility: hidden">Строчка </span>
                </#if>
                <div>
                    <div>

                        <div>
                            <span>
                                <a href="/product/${store.idStore}"> Редактировать продукт </a>
                            </span>
                            <span>
                                <a href="/product/${store.idStore}"> Удалить продукт </a>
                            </span>
                        </div>

                        <div>
                            <#if store.filename??>
                                <img src="/img/${store.filename}">
                            </#if>
                        </div>
                        <b>${store.idStore}</b>
                        <b>${store.nameStore}</b>
                        <b>${store.addressStore}</b>
                    </div>
                </div>
            <#else>
                В базе нет ни одного склада
            </#list>
        </div>
    </div>
</@C.page>