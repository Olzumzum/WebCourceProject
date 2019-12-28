<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
    <div>
        <label> Сделать заказ</label>

        <div>
            <form method="post" action="/order">
                <label> Название продукта </label>
                <select name="nameProduct">
                    <#list itemProductList as itemProd>
                        <option value="${itemProd.nameItemProduct}">${itemProd.nameItemProduct}</option>
                    </#list>
                </select>
        </div>

        <div>
            <label> Склад </label>
            <select name="nameStore">
                <#list storesList as store>
                    <option value="${store.nameStore}">${store.nameStore}</option>
                </#list>
            </select>
        </div>

        <div>
            <label> Количество </label>
            <input type="number" name="amountOrder"/>
        </div>
        <label> ${message}</label>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="Отправить заказ"/>
        </form>

    </div>

</@C.page>