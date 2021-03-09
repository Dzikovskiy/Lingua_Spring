<#macro modal>

    <div class="modal fade" id="addCourseModal" tabindex="-1" role="dialog" aria-labelledby="addCourseModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="addOperationModalLabel">Add course</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body ">
                    <form method="post" action="/saveCourse">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <div class="form-group mb-3">
                            <label for="text" class="col-form-label">Course name</label>
                            <input type="text" class="form-control" id="course_name" name="course_name" value=""
                                   placeholder="enter course name" required>
                        </div>
                        <div class="form-group mb-3">
                            <div class="row justify-content-center mt-3">
                                <button type="submit" class="btn btn-primary ">Add</button>
                            </div>
                        </div>
                    </form>
                    <#if courses?has_content>
                        <table class="table table-sm pb-5 pt-3 table-striped">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Course</th>
                                <th scope="col"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list courses as course>
                                <tr>
                                    <th scope="row">${course?counter}</th>
                                    <td>${course.name}</td>
                                    <td>
                                        <form method="post" action="/deleteCourse">
                                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                            <input type="text" class="form-control" id="id" name="id"
                                                   value="${course.id}" readonly hidden>
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