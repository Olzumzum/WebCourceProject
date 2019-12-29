<#macro add_sale itemproducts >

    <div >
        <div> Добавить продажу </div>
        <form method="post" enctype="multipart/form-data">

            <div>
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
                <label > Количество: </label>
                <input type="number" name="amountProd"/>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="submit" value="Отправить"/>
        </form>
    </div>
</#macro>