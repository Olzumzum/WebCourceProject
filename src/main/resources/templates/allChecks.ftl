<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >
<#import "parts/search_form.ftl" as S>
<#import "parts/add_sale.ftl" as AD>

<@C.page>
<@S.search_form "/allChecks" />
    <div>
<@AD.add_sale itemproducts />

        <div>
            <table>
                <colgroup>
                    <col id="item_sale_id">
                    <col id="item_name"/>
                    <col id="item_price"/>
                    <col id="amount"/>
                    <col id="final_score"/>
                </colgroup>

                <thread>
                    <tr>
                        <th scope="col"> id Покупки</th>
                        <th scope="col"> Именование товара</th>
                        <th scope="col"> Стоимость единицы товара</th>
                        <th scope="col"> Количество</th>
                        <th scope="col"> Итого</th>
                    </tr>
                </thread>

                <tbody>
                <#list itemsales as isale>
                    <tr>
                        <td> ${isale.idItemSale}</td>
                        <td> ${isale.itemProduct.nameItemProduct}</td>
                        <td> ${isale.itemProduct.price}</td>
                        <td> ${isale.amount}</td>
                        <td> ${isale.finalScore}</td>
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