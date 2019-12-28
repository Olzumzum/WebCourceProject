<#macro add_sale itemproducts >

    <div class="add_sale">
        <div id="title_submenu"> Добавить продажу </div>
        <form method="post" enctype="multipart/form-data">

            <div class="row_form">
                <label> Название продукта </label>
                <select name="nameProduct">
                    <#list itemproducts as iproduct>
                        <option value="${iproduct.nameItemProduct}">
                            ${iproduct.nameItemProduct}
                        </option>
                    </#list>
                </select>
            </div>

            <div>
                <label class="row_form"> Количество: </label>
                <input type="number" name="amountProd"/>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="submit" value="Отправить" class="button_add_file"/>
        </form>
    </div>
</#macro>