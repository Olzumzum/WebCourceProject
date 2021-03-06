<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >
<#import "parts/search_form.ftl" as S>
<#import "parts/add_sale.ftl" as AD>

<@C.page>
    <div>
        <div class="mt-3 mb-3">
            <a href="allChecks"> Посмотреть все чеки </a>
        </div>
        <button class="btn btn-primary" type="button" data-toggle="collapse"
                data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
            Добавить продажу
        </button>
        <@AD.add_sale itemproducts />
    </div>
    <div>
        <div class="mt-3 mb-3">
            <label> Общее количество проданных товаров</label>
        </div>

        <table class="table table-sm">
            <colgroup>
                <col id="item_name"/>
                <col id="item_price"/>
                <col id="amount"/>
                <col id="final_score"/>
            </colgroup>

            <thread>
                <tr>
                    <th scope="col"> Именование товара</th>
                    <th scope="col"> Стоимость единицы товара</th>
                    <th scope="col"> Количество</th>
                    <th scope="col"> Итого</th>
                </tr>
            </thread>

            <tbody>
            <#list totalList as itemTotal>
                <tr>
                    <td> ${itemTotal.itemProduct.nameItemProduct}</td>
                    <td> ${itemTotal.itemProduct.price}</td>
                    <td> ${itemTotal.amount}</td>
                    <td> ${itemTotal.finalScore}</td>
                </tr>
            <#else>
                <div>
                    Нет ни одной продажи
                </div>
            </#list>
            </tbody>
        </table>
    </div>
    </div>
</@C.page>