<#macro searchAmount path>
    <form method="get" class="forms mt-2 mb-2" action=${path}>
        <div class="form-row ml-8">
            <label class="mr-2"> По количеству: </label>
            <div class="row mb-2">
                <input class="form-control col-3 ml-3 mr-1" type="number" name="minAmount" placeholder="min количество"
                       value="${minAmount?if_exists}"/>
                <input class="form-control col-3" type="number" name="maxAmount" placeholder="max количество"
                       value="${maxAmount?if_exists}"/>
                <div class="col-auto">
                    <input class="btn btn-primary" type="submit" value=" Поиск "/>
                </div>
            </div>
        </div>
    </form>
</#macro>