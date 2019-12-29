<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
    <div>
    <label> Сделать заказ</label>

    <div>
        <form method="post" action="/order">
            <label> Продукт </label>
            <select name="nameProduct" class="browser-default custom-select col-4 ml-2">
                <#list itemProductList as itemProd>
                    <option value="${itemProd.nameItemProduct}">${itemProd.nameItemProduct}</option>
                </#list>
            </select>

            <div class="mt-3">
                <label class="mr-2"> Склад </label>
                <select name="nameStore" class="browser-default custom-select col-4 ml-2">
                    <#list storesList as store>
                        <option value="${store.nameStore}">${store.nameStore}</option>
                    </#list>
                </select>
            </div>

            <div class="row mb-4 mt-3">
                <label> Количество </label>
                <input type="number" name="amountOrder" class="form-control ml-2 col-2"/>
            </div>
            <label> ${message}</label>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="submit" value="Отправить заказ" class=" btn btn-primary"/>
        </form>

    </div>

</@C.page>