<#macro add_sale itemproducts >
    <div class="collapse mt-4 mb-5" id="collapseExample">
    <div class="card card-body">
        <form method="post" enctype="multipart/form-data">
            <div class="form-row mt-3 mb-1">
                <label for="nameitemProduct" class="mr-3"> Название продукта </label>
                <select name="nameProduct" class="browser-default custom-select col-4">
                    <#list itemproducts as iproduct>
                        <option value="${iproduct.nameItemProduct}">
                            ${iproduct.nameItemProduct}
                        </option>
                    </#list>
                </select>
            </div>

            <div class="form-row mt-3 mb-1">
                <label class="mr-5 mb-3"> Количество: </label>
                <input type="number" name="amountProd" class="form-control mr-2 mb-3 col-3"/>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="submit" value="Отправить" class="btn btn-primary"/>
        </form>
    </div>
</#macro>