<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
    <div class="add_product">
    <div id="title_submenu"> Добавить поставщика</div>
    <form method="post" enctype="multipart/form-data">
        <div class="row_form">
            <label> Название компании </label>
            <input type="text" name="nameSupplier" class="subparagraph_submenu"/>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="Сохранить" class="button_add_file"/>
    </form>
    </div>

    <div>
        <table>
            <colgroup>
                <col id="idSupplierCompany"/>
                <col id="nameSupplierCompany"/>
                <col id="editSupplierCompany"/>
            </colgroup>

            <thread>
                <tr>
                    <th scope="col"> id</th>
                    <th scope="col"> Название компании поставщика </th>

                </tr>
            </thread>
            <tbody>
            <#list suppliers as supplier>
                <tr>
                    <td>${supplier.idSupplier}</td>
                    <td>${supplier.nameSupplier}</td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>


</@C.page>