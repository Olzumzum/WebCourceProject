<#macro search_name path>
    <form method="get" class="forms mt-2 mb-2" action=${path}>
        <div class="form-row ml-8">
            <div class="mr-2"> Поиск по названию: </div>
            <div class="col-6">
                <input class="form-control" placeholder="Название продукта" type="search"
                       name="searchName" value="${nameFilter?if_exists}"/>
            </div>
            <div class="col-auto">
                <input class=" btn btn-primary" type="submit" value=" Поиск"/>
            </div>
        </div>
    </form>

</#macro>