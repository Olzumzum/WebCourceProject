<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>

    <div>
        <table class="table table-hover">
            <colgroup>
                <col id="store_id">
                <col id="store_name"/>
                <col id="store_adress"/>
            </colgroup>

            <thread>
                <tr>
                    <th scope="col"> id </th>
                    <th scope="col"> Имя склада </th>
                    <th scope="col"> Адрес</th>
                </tr>
            </thread>

            <tbody>
                <#list stores as store>
                    <tr>
                        <td scope="row"> ${store.idStore}</td>
                        <td> ${store.nameStore}</td>
                        <td> ${store.addressStore}</td>
                    </tr>
                </#list>
            </tbody>
        </table>
    </div>

</@C.page>