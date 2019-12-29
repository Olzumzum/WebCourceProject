<#macro searchAmount path>
    <form method="get" action=${path}>
        <label> Поиск по количеству </label>
        <input type="number" name="minAmount" placeholder="Минимальное количество" value="${minAmount?if_exists}"/>
        <input type="number" name="maxAmount" placeholder="Максимальное количество" value="${maxAmount?if_exists}"/>
        <input type="submit" value="Поиск по ценовому диапазону"/>
    </form>
</#macro>