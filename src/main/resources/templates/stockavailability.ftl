<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>

    <div>
    <div>
        <a href="/stores"> Подробная инфомрация о складах </a>
    </div>
    <div>
        <table class="table table-hover mt-4">
            <colgroup>
                <col id="item_name"/>
                <col id="store_name"/>
                <col id="amount"/>
            </colgroup>

            <thread>
                <tr class="table-primary">
                    <th scope="col"> Именование товара </th>
                    <th scope="col"> Название склада </th>
                    <th scope="col"> Количество </th>
                </tr>
            </thread>

            <tbody>
            <#list stockList as itemStock>
                <tr>
                    <td> ${itemStock.itemProduct.nameItemProduct}</td>
                    <td> ${itemStock.store.nameStore}</td>
                    <td> ${itemStock.amountItemProduct}</td>
                </tr>
            <#else>
                <div>
                    Товар пропал, плачьте
                </div>
            </#list>

            </tbody>
        </table>
    </div>

</@C.page>