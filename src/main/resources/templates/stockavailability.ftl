<html lang="ru">
<head>
    <meta charset="utf-8">
</head>
<body>

<div>
    <form action="/logout" method="post">
        <input type="submit" value="Выйти"/>
    </form>
</div>
<div>
    <form method="post">
        <input type="text" name="stores"/>
        <input type="number" name="amount"/>
        <input type="hidden" name="_csrf" value="{{_csrf.token}}" />
        <input type="submit" value="Добавить" />
    </form>

<div> Список сообщений</div>
{{#stockAvailability}}
    <b>{{idStores}}</b>
    <b>{{idStockAvailability}}</b>
    <b>{{amount}}</b>
{{/stockAvailability}}
</body>
</html>