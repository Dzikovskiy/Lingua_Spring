<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isTech = user.isTech()
    isDispatcher = user.isDispatcher()
    isForeman = user.isForeman()
    >
<#else>
    <#assign
    name = ""
    isTech = false
    isDispatcher= false
    isForeman  = false
    >
</#if>