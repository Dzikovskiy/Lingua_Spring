<#macro modal>

    <div class="modal fade" id="joinCourseModal" tabindex="-1" role="dialog" aria-labelledby="joinCourseModalLabel"
         aria-hidden="true">
        <div class="modal-dialog " role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="addOperationModalLabel">Join course</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body ">
                    <form method="post" action="/joinCourse">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <div class="form-group  my-3">
                                <h6><label for="text" class="col-sm-2 col-form-label">Course:</label></h6>
                                <div class="col-sm-8 mx-auto">
                                    <select name="course_id" id="course_id" class="custom-select">
                                        <#if courses?has_content>
                                            <option default selected>Choose course</option>
                                            <#list courses as course>
                                                <option id="course_id" value="${course.id}">${course.name}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                </div>
                        </div>
                        <div class="form-group mt-5">
                            <div class="row justify-content-center mt-3">
                                <button type="submit" class="btn btn-primary ">Join</button>
                            </div>
                        </div>
                    </form>
                    <#if joinedCourses??>
                        <table class="table table-sm pb-5 pt-3 table-striped">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Your courses</th>
                                <th scope="col"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list joinedCourses as course>
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