<#import "parts/login.ftl" as l>
<#import "parts/common.ftl" as c>
<@c.page>
    <div class="container mt-5 pt-5">
        <div class="login-header mb-5">Пожалуйста войдите</div>
        <b>${message?ifExists}</b>
            <form action="/login" method="post">
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

                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                <div class="form-group row justify-content-md-center">
                    <div class="col-sm-2"><a href="/registration">Создать аккаунт</a></div>
                    <div class="col-sm-3">
                        <button type="submit"
                                class="btn btn-primary ">Войти</button>
                    </div>
                </div>
            </form>

    </div>
</@c.page>