<#macro search_by_price path>
    <form method="get" class="forms mt-2 mb-2" action=${path}>
        <div class="form-row ml-8">
            <label class="mr-2"> Поиск по цене: </label>
            <div class="row mb-2">
                <input class="form-control col-3 ml-3 mr-1" type="number" name="minPriceForm" placeholder="min цена"
                       value="${minPrice?if_exists}"/>
                <input class="form-control col-3" type="number" name="maxPriceForm" placeholder="max цена"
                       value="${maxPrice?if_exists}"/>
                <div class="col-auto">
                    <input class="btn btn-primary" type="submit" value=" Поиск "/>
                </div>
            </div>
        </div>
    </form>
</#macro>

