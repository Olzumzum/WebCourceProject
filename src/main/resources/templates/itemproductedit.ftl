<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
    <form method="post" enctype="multipart/form-data">
        <div> Редактирвоать элемент</div>
        <#if itemProduct.fileName??>
            <img style="width: 200px; height: 200px" src="/img/${itemProduct.fileName}">
        </#if>

        <div>
            <label> Идентификатор: </label>
            <b>${itemProduct.idItemProduct}</b>
        </div>
        <div>
            <label> Название: </label>
            <input type="text" name="nameitemProduct" class="subparagraph_submenu"
                   value="${itemProduct.nameItemProduct}"/>
        </div>

        <div class="row_form">
            <label> Изменить изображение </label>
            <input type="file" name="file"/>
        </div>

        <div>
            <label> Стоимость: </label>
            <input type="text" name="price" class="subparagraph_submenu"
                   value="${itemProduct.price}"/>
        </div>

        <div class="row_form">
            <label>
                <select name="supplier">
                    <option disabled>Компания поставщик</option>
                    <#list suppliers as supplier>
                        <#if supplier == itemProduct.supplierCompany >
                            <option value="${supplier.idSupplier}" class="subparagraph_submenu" selected>
                                ${supplier.nameSupplier}
                            </option>
                        <#else>
                            <option value="${supplier.idSupplier}" class="subparagraph_submenu">
                                ${supplier.nameSupplier}
                            </option>
                        </#if>
                    </#list>
                </select>
            </label>
        </div>

        <div class="row_form">
            <label> Возрастная категория </label>
            <select name="ageCategory">
                <#list agecategories as agecategory>
                    <#if agecategory == itemProduct.ageCategory>
                        <option class="subparagraph_submenu" selected>
                            <b>${agecategory.toString()}</b>
                        </option>

                    <#else>
                        <option class="subparagraph_submenu">
                            <b>${agecategory.toString()}</b>
                        </option>
                    </#if>
                </#list>
            </select>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="Сохранить изменения" class="button_add_file"/>
    </form>
</@C.page>