<#macro search_form path>
    <div>
        <label> Поиск чека по названию продукта </label>
        <form method="get" action=${path}>
            <input type="text" name="searchName" value="${nameFilter?if_exists}"/>
            <input type="submit" value="Поиск"/>
        </form>
        <form method="get" action=${path}>
            <label> Поиск по ценовому диапазону</label>
            <input name="minPrice" placeholder="Минимальная цена" value="${minPrice?if_exists}"/>
            <input name="maxPrice" placeholder="Максимальная цена" value="${maxPrice?if_exists}"/>
            <input type="submit" value="Поиск по ценовому диапазону"/>
        </form>
        <form method="get" action=${path}>
            <label> Поиск по количеству </label>
            <input type="number" name="minAmount" placeholder="Минимальное количество" value="${minAmount?if_exists}"/>
            <input type="number" name="maxAmount" placeholder="Максимальное количество" value="${maxAmount?if_exists}"/>
            <input type="submit" value="Поиск по ценовому диапазону"/>
        </form>

        <div>
            <a href=${path}> Показать все результаты </a>
        </div>
    </div>
</#macro>