<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >

<@C.page>
    <p>
        <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample"
                aria-expanded="false" aria-controls="collapseExample">
            Добавить поставщика
        </button>
    </p>
    <div class="collapse" id="collapseExample">
        <div class="card card-body">
            <form method="post" enctype="multipart/form-data" class="form-inline">
                <div class="form-group mx-sm-3 mb-2" >
                    <label class="mr-2"> Название компании </label>
                    <input type="text" name="nameSupplier" placeholder="Название компании"/>
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="submit" value="Сохранить" class="btn btn-primary mb-2"/>
            </form>
        </div>
    </div>

    <div>
        <table class="table table-sm">
            <colgroup>
                <col id="idSupplierCompany"/>
                <col id="nameSupplierCompany"/>
                <col id="editSupplierCompany"/>
            </colgroup>

            <thread>
                <tr class="table-success pr-5 pl-5 pt-3 pb-3">
                    <th scope="col"> id</th>
                    <th scope="col"> Название компании поставщика</th>

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