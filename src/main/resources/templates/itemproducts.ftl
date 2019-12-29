<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >
<#include "parts/security.ftl">

<@C.page>
    <div class="form_search">
        <div> Искать по названию склада</div>
        <form method="get" action="/itemproducts">
            <input type="text" name="nameFilter" value="${nameFilter?if_exists}"/>
            <input type="submit" value="Поиск"/>
        </form>
    </div>

    <div>
        <#if isAdmin>
            <div>
                <div> Добавить продукт</div>
                <form method="post" enctype="multipart/form-data">

                    <div>
                        <label> Название продукта </label>
                        <input type="text" name="nameitemProduct"/>
                    </div>

                    <div>
                        <label> Цена </label>
                        <input type="number" name="price"/>
                    </div>

                    <div>
                        <label> Изображение</label>
                        <input type="file" name="file"/>
                    </div>

                    <div>
                        <label>
                            <select name="supplier">
                                <option disabled>Компания поставщик</option>
                                <#list suppliers as supplier>
                                    <option value="${supplier.idSupplier}">
                                        ${supplier.nameSupplier}
                                    </option>
                                </#list>
                            </select>
                        </label>
                    </div>

                    <div>
                        <label> Возрастная категория </label>
                        <select name="ageCategory">
                            <#list agecategories as agecategory>
                                <option>
                                    <b>${agecategory.toString()}</b>
                                </option>
                            </#list>
                        </select>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input type="submit" value="Отправить"/>
                </form>
            </div>
        </#if>

        <div>
            <div> Список всей продукции</div>
            <#list itemproducts as itemProduct>
                <#if itemProduct.idItemProduct % 2 == 0>
                    <span >Строчка </span>
                </#if>
                <div>
                    <div>

                        <#if isAdmin>
                            <div>
                            <span>
                                <a href="/itemProductEdit/${itemProduct.idItemProduct}"> Редактировать продукт </a>
                            </span>
                                <span>
                                <a href="/itemproducts/${itemProduct.idItemProduct}"> Удалить продукт </a>
                            </span>
                            </div>
                        </#if>

                        <div>
                            <#if itemProduct.fileName??>
                                <img src="/img/${itemProduct.fileName}">
                            </#if>
                        </div>
                        <div>
                            <label> Идентификатор: </label>
                            <b>${itemProduct.idItemProduct}</b>
                        </div>
                        <div>
                            <label> Название: </label>
                            <b>${itemProduct.nameItemProduct}</b>
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