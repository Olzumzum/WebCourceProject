<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
    <div class="container">
        <div>
            <a href="allChecks"> Посмотреть все чеки </a>
        </div>

        <div class="add_sale">
            <div id="title_submenu"> Добавить продажу</div>
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

        <div>
            <div>
                <label> Общее количество проданных товаров</label>
            </div>

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
                <#list totalList as itemTotal>
                    <tr>
                        <td> ${itemTotal.idItemSale}</td>
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