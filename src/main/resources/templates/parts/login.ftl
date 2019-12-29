<#include "security.ftl">
<#macro login path isRegisterForm>
    <form action="${path}" method="post" class="form-group">
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-2 col-form-label"> User Name </label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="username"/>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label"> Password: </label>

            <div class="col-sm-4">
                <input type="password" class="form-control" name="password"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <div class="form-group row ml-2">
            <#if isRegisterForm>
                <button class="btn btn-primary"> Создать</button>
            <#else>
                <button class="btn btn-primary"> Войти</button>
            </#if>

            <#if !isRegisterForm>
                <div class="col-sm-15 ml-5">
                    <a href="/registration">Регистрация</a>
                </div>
            </#if>
        </div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if isUser || isAdmin>
        <button class="btn btn-primary ml-2"> Выйти</button>
        <#else>
            <button class="btn btn-primary ml-2"> Войти </button>
        </#if>
    </form>
</#macro>