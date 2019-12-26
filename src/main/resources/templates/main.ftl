<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
    <div class="form_search">
        <div> Искать по названию склада</div>
        <form method="get" action="/main">
            <input type="text" name="nameFilter" value="${nameFilter?if_exists}" class="search_field"/>
            <input type="submit" value="Поиск" class="button_search "/>
        </form>
    </div>

    <div class="container">
        <div class="add_product">
            <div id="title_submenu"> Добавить продукт</div>
            <form method="post" enctype="multipart/form-data">
                <div class="row_form">
                    <label> Название продукта </label>
                    <input type="text" name="nameStore" class="subparagraph_submenu"/>
                </div>
                <div class="row_form">
                    <label> В данном случае адресс</label>
                    <input type="text" name="addressStore" class="subparagraph_submenu"/>
                </div>
                <div class="row_form">
                    <label> Изображение</label>
                    <input type="file" name="file"/>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="submit" value="Отправить" class="button_add_file"/>
            </form>
        </div>

        <div class="content">
            <div> Список складов</div>
            <#list stores as store>
                <#if store.idStore % 2 == 0>
                    <span style="visibility: hidden">Строчка </span>
                </#if>
                <div class="item_product">
                    <div class="content_item_product">

                        <div class="edit_product">
                            <span>
                                <a href="/product/${store.idStore}"
                                   class="property_product_item"> Редактировать продукт </a>
                            </span>
                            <span>
                                <a href="/product/${store.idStore}" class="property_product_item"> Удалить продукт </a>
                            </span>
                        </div>

                        <div>
                            <#if store.filename??>
                                <img class="image_product" src="/img/${store.filename}">
                            </#if>
                        </div>
                        <b>${store.idStore}</b>
                        <b class="name_product">${store.nameStore}</b>
                        <b>${store.addressStore}</b>
                    </div>
                </div>
            <#else>
                В базе нет ни одного склада
            </#list>
        </div>
    </div>
</@C.page>