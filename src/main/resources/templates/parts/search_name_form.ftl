<#macro search_name path>
    <form method="get" action=${path}>
        <div class="form-row ml-8">
            <div class="mr-2"> Поиск: </div>
            <div class="col-7">
                <input class="form-control" placeholder="Название продукта" type="search"
                       name="searchName" value="${nameFilter?if_exists}"/>
            </div>
            <div class="col-auto">
                <input class=" btn btn-primary" type="submit" value="Поиск"/>
            </div>
        </div>
    </form>

</#macro>