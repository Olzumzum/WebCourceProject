<#macro search_by_price path>
    <form method="get" action=${path}>
        <label> Поиск по ценовому диапазону</label>
        <input name="minPrice" placeholder="Минимальная цена" value="${minPrice?if_exists}"/>
        <input name="maxPrice" placeholder="Максимальная цена" value="${maxPrice?if_exists}"/>
        <input type="submit" value="Поиск по ценовому диапазону"/>
    </form>
</#macro>

