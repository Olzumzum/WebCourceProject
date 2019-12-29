<#macro add_prodcut >
    <div class="collapse mt-4 mb-5" id="collapseExample">
        <div class="card card-body">
            <form method="post" enctype="multipart/form-data">
                <div class="form-row mt-3 mb-1">
                    <label for="nameitemProduct" class="mr-2"> Название продукта </label>
                    <input id="nameitemProduct" type="text" name="nameitemProduct" class="form-control col-2"/>
                </div>

                <div class="form-row mt-3 mb-1">
                    <label for="price" class="mr-2"> Цена </label>
                    <input id="price" type="number" name="price" class="form-control col-2"/>
                </div>

                <div class="form-row mt-3 mb-1">
                    <label class="mr-2"> Изображение</label>
                    <input type="file" name="file" class="ml-2"
                           id="validatedCustomFile" />
                </div>

                <div class="form-row mt-3 mb-1">
                    <label for="suplier" class="mr-2"> Компания поставщик </label>
                    <select id="suplier" name="supplier" class="form-control col-2 ml-2">
                        <#list suppliers as supplier>
                            <option value="${supplier.idSupplier}">
                                ${supplier.nameSupplier}
                            </option>
                        </#list>
                    </select>
                </div>

                <div class="form-row mt-3 mb-1">
                    <label for="ageCategory" class="mr-2"> Возрастная категория </label>
                    <select id="ageCategory" name="ageCategory" class="form-control col-2">
                        <#list agecategories as agecategory>
                            <option>
                                <b>${agecategory.toString()}</b>
                            </option>
                        </#list>
                    </select>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input class="btn btn-primary" type="submit" value="Сохранить"/>
            </form>
        </div>
    </div>
</#macro>