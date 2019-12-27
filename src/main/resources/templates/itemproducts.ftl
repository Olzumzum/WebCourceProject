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
                    <input type="text" name="nameitemProduct" class="subparagraph_submenu"/>
                </div>

                <div class="row_form">
                    <label> Цена </label>
                    <input type="number" name="price" class="subparagraph_submenu"/>
                </div>

                <div class="row_form">
                    <label> Изображение</label>
                    <input type="file" name="file"/>
                </div>

                <div class="row_form">
                    <label>
                        <select name="supplier">
                            <option disabled>Компания поставщик</option>
                            <#list suppliers as supplier>
                                <option value="${supplier.idSupplier}" class="subparagraph_submenu">
                                    ${supplier.nameSupplier}
                                </option>
                            </#list>
                        </select>
                    </label>
                </div>

                <div class="row_form">
                    <label> Возрастная категория </label>
                    <select name="ageCategory">
                        <#list agecategories as agecategory>
                            <option class="subparagraph_submenu">
                                <b>${agecategory.toString()}</b>
                            </option>
                        </#list>
                    </select>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="submit" value="Отправить" class="button_add_file"/>
            </form>
        </div>

        <div class="content">
            <div> Список всей продукции</div>
            <#list itemproducts as itemProduct>
                <#if itemProduct.idItemProduct % 2 == 0>
                    <span style="visibility: hidden">Строчка </span>
                </#if>
                <div class="item_product">
                    <div class="content_item_product">

                        <div class="edit_product">
                            <span>
                                <a href="/itemProductEdit/${itemProduct.idItemProduct}"
                                   class="property_product_item"> Редактировать продукт </a>
                            </span>
                            <span>
                                <a href="/itemproducts/${itemProduct.idItemProduct}"
                                   class="property_product_item"> Удалить продукт </a>
                            </span>
                        </div>

                        <div>
                            <#if itemProduct.fileName??>
                                <img class="image_product" src="/img/${itemProduct.fileName}">
                            </#if>
                        </div>
                        <div>
                            <label> Идентификатор: </label>
                            <b>${itemProduct.idItemProduct}</b>
                        </div>
                        <div>
                            <label> Название: </label>
                            <b class="name_product">${itemProduct.nameItemProduct}</b>
                        </div>
                        <div>
                            <label> Стоимость: </label>
                            <b>${itemProduct.price}</b>
                        </div>
                        <div>
                            <label> Поставщик: </label>
                            <b>${itemProduct.supplierCompany.nameSupplier}</b>
                        </div>
                        <div>
                            <label> Возрастная категория: </label>
                            <b>${itemProduct.ageCategory}</b>
                        </div>
                    </div>
                </div>
            <#else>
                В базе нет ни одного продукта
            </#list>
        </div>
    </div>
</@C.page>