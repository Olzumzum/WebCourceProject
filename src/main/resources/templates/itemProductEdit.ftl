<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>

    <div class="add_product">
        <div id="title_submenu"> Редактировать продукт</div>
        <form method="post" enctype="multipart/form-data">

            <div class="row_form">
                <label> Название продукта </label>
                <input type="text" name="nameitemProduct" class="subparagraph_submenu" value=""/>
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

</@C.page>