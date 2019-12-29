<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
    <form method="post" enctype="multipart/form-data">
        <div> Редактирвоать элемент</div>
        <#if itemProduct.fileName??>
            <img src="/img/${itemProduct.fileName}">
        </#if>

        <div>
            <label> Идентификатор: </label>
            <b>${itemProduct.idItemProduct}</b>
        </div>
        <div>
            <label> Название: </label>
            <input type="text" name="nameitemProduct" value="${itemProduct.nameItemProduct}"/>
        </div>

        <div>
            <label> Изменить изображение </label>
            <input type="file" name="file"/>
        </div>

        <div>
            <label> Стоимость: </label>
            <input type="text" name="price" value="${itemProduct.price}"/>
        </div>

        <div class="row_form">
            <label>
                <select name="supplier">
                    <option disabled>Компания поставщик</option>
                    <#list suppliers as supplier>
                        <#if supplier == itemProduct.supplierCompany >
                            <option value="${supplier.idSupplier}" selected>
                                ${supplier.nameSupplier}
                            </option>
                        <#else>
                            <option value="${supplier.idSupplier}" >
                                ${supplier.nameSupplier}
                            </option>
                        </#if>
                    </#list>
                </select>
            </label>
        </div>

        <div>
            <label> Возрастная категория </label>
            <select name="ageCategory">
                <#list agecategories as agecategory>
                    <#if agecategory == itemProduct.ageCategory>
                        <option selected>
                            <b>${agecategory.toString()}</b>
                        </option>

                    <#else>
                        <option>
                            <b>${agecategory.toString()}</b>
                        </option>
                    </#if>
                </#list>
            </select>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="Сохранить изменения"/>
    </form>
</@C.page>