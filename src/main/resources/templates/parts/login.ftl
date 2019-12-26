<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div>
            <label> User Name : <input type="text" name="username"/> </label>
        </div>
        <div>
            <label> Password: <input type="password" name="password"/> </label>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />

        <div><input type="submit" value="Войти"/></div>
        <#if !isRegisterForm>
        <a href="/registration">Регистрация</a>
        </#if>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <input type="submit" value="Выйти" class="login_nav_button"/>
    </form>
</#macro>