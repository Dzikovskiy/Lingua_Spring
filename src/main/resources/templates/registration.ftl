<#import "parts/login.ftl" as l>
<#import "parts/common.ftl" as c>

<@c.page>
    <div class="container mt-5 pt-5">
        <div class="login-header mb-5">Регистрация</div>
        <b>${message?ifExists}</b>
        <@l.login "/registration" true />
    </div>
</@c.page>