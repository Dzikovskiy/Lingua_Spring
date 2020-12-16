<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row justify-content-md-center">
            <label class="col-sm-2 col-form-label"> Логин : </label>
            <div class="col-sm-3">
                <input class="form-control" type="text" name="username" placeholder="Логин" required/>
            </div>
        </div>
        <div class="form-group row justify-content-md-center">
            <label class="col-sm-2 col-form-label"> Пароль: </label>
            <div class="col-sm-3">
                <input class="form-control" type="password" name="password" placeholder="Пароль" minlength="8" required/>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row justify-content-md-center">
                <label class="col-sm-2 col-form-label"> Email: </label>
                <div class="col-sm-3">
                    <input class="form-control" type="email" name="email" placeholder="Email" required/>
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <div class="form-group row justify-content-md-center">
            <div class="col-sm-2"><#if !isRegisterForm><a href="/registration">Создать аккаунт</a></#if></div>
            <div class="col-sm-3">
                <button type="submit"
                        class="btn btn-primary "><#if isRegisterForm>Зарегистрироваться<#else>Войти</#if></button>
            </div>
        </div>
    </form>
</#macro>
<#macro logout>

    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Выйти</button>
    </form>

</#macro>