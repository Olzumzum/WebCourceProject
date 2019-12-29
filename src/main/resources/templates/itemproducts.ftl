<#import "parts/common.ftl" as C >
<#import "parts/login.ftl" as l >
<#include "parts/security.ftl">
<#import "parts/add_product.ftl" as addP >
<#import "parts/search_name_form.ftl" as search_name>
<#import "parts/show_all_result.ftl" as show_result>
<#import "parts/search_by_price.ftl" as search_price>
<#import "parts/search_age.ftl" as search_age>
<#import "parts/sorted_name.ftl" as sort_name>

<@C.page>
    <div class="row">
        <div class="col-sm-5">
            <#if isAdmin>
                <button class="btn btn-primary" type="button" data-toggle="collapse"
                        data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                    Добавить новый товар
                </button>
                <@addP.add_prodcut/>
            </#if>
        </div>
        <div class="col-sm-7">
            <div class="row">
                <@search_name.search_name "/itemproducts" />
            </div>
            <div class="row">
                <@search_price.search_by_price "/itemproducts" />
            </div>
            <div class="row">
                <@show_result.show_all_result "/itemproducts"/>
            </div>
            <div class="row">
                <@search_age.search_age "/itemproducts" />
                <@sort_name.search_name "/itemproducts" />
            </div>
        </div>
    </div>
    <div>
        <div class="row mb-3 "> Список продукции</div>

        <#list itemproducts as itemProduct>
            <#if itemProduct.idItemProduct % 2 != 0>
                <div style="display: flex; flex-direction: row">
            </#if>

            <div class="col-sm" style="display: flex; flex-direction: row">
                <div class="card mb-3" style="max-width: 500px; max-height: 260px">
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <#if itemProduct.fileName??>
                                <img src="/img/${itemProduct.fileName}" class="card-img">
                            </#if>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body mr-1">
                                <div class="row">
                                    <label class="card-text"> Идентификатор: </label>
                                    <b>${itemProduct.idItemProduct}</b>
                                </div>
                                <div class="row">
                                    <label class="card-title"> Название: </label>
                                    <b>${itemProduct.nameItemProduct}</b>
                                </div>
                                <div class="row">
                                    <label class="card-text"> Стоимость: </label>
                                    <b>${itemProduct.price}</b>
                                </div>
                                <div class="row">
                                    <label class="card-text"> Поставщик: </label>
                                    <b>${itemProduct.supplierCompany.nameSupplier}</b>
                                </div>
                                <div class="row">
                                    <label class="card-text"> Возрастная категория: </label>
                                    <b>${itemProduct.ageCategory}</b>
                                </div>
                                <#if isAdmin>
                                    <a href="/itemProductEdit/${itemProduct.idItemProduct}" class="card-text">
                                        <small class="text-muted mr-3"> Редактировать продукт </small>
                                    </a>

                                    <a href="/itemproducts/${itemProduct.idItemProduct}" class="card-text">
                                        <small class="text-muted"> Удалить продукт </small>
                                    </a>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <#if itemProduct.idItemProduct % 2 == 0>
                </div>
            </#if>
        <#else>
            В базе нет ни одного продукта
        </#list>
    </div>


</@C.page>