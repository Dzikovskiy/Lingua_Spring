<#macro modal>

    <div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="editProfileModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="editProfileModalLabel">Edit profile</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body ">
                    <form method="post" action="/saveProfile">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <div class="form-group mb-3">
                            <label for="text" class="col-form-label">Name</label>
                            <input type="text" class="form-control" id="username" name="username"
                                   value="<#if name?has_content>${name}</#if>"
                                   placeholder="enter your name" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="text" class="col-form-label">Email</label>
                            <input class="form-control" type="email" name="email" placeholder="email"
                                   value="<#if email?has_content>${email}</#if>" required/>
                        </div>
                        <div class="form-group mb-3">
                            <label for="text" class="col-form-label">Password</label>
                            <input class="form-control" type="password" name="password" placeholder="new password"
                                   minlength="8"
                                   required/>
                        </div>
                        <div class="form-group mb-3">
                            <div class="row justify-content-center mt-3">
                                <button type="submit" class="btn btn-primary ">Save</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</#macro>