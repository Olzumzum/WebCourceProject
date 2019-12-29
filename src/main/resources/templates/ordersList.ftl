<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
   <div>
       <table class="table">
           <colgroup>
               <col id="id_order"/>
               <col id="name_product"/>
               <col id="name_store"/>
               <col id="amount"/>
           </colgroup>

           <thread>
               <tr class="bg-warning">
                   <th scope="col"> id заказа</th>
                   <th scope="col"> Название продукта </th>
                   <th scope="col"> Название склада </th>
                   <th scope="col"> Количество </th>
               </tr>
           </thread>

           <tbody>
           <#list orders as order>
               <tr>
                   <td> ${order.idOrder}</td>
                   <td> ${order.itemProduct.nameItemProduct}</td>
                   <td> ${order.stores.nameStore}</td>
                   <td> ${order.amount}</td>
               </tr>
           <#else>
               <div>
                   Нет ни одной продажи
               </div>
           </#list>
           </tbody>
       </table>
   </div>

</@C.page>