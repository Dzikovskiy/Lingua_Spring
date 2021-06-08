<#macro modal>

    <div class="modal fade" id="editUsersModal">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="editUsersLabel">Edit users</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body ">
                    <#if users?has_content>
                        <table class="table table-sm pb-5 pt-3 table-striped">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Id</th>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list users as u>
                                <tr>
                                    <th scope="row">${u?counter}</th>
                                    <td>${u.id}</td>
                                    <td>${u.username}</td>
                                    <td>${u.email}</td>
                                    <td><a data-toggle="modal" href="#editUserProfileModal" class="btn btn-outline-primary edit-user-modal-btn"
                                           data-id="${u.id}" data-username="${u.username}" data-email="${u.email}">edit</a>
<#--                                        <button type="button" class="btn btn-outline-primary edit-user-modal-btn">edit</button>-->
                                    </td>
                                    <td>
                                        <form method="post" action="/deleteUser">
                                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                            <input type="text" class="form-control" id="id" name="id"
                                                   value="${u.id}" readonly hidden>
                                            <button type="submit" class="btn btn-outline-danger btn-sm">ꟷ</button>
                                        </form>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </#if>
                </div>
            </div>
        </div>
    </div>

</#macro>