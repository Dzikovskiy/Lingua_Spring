<#macro modal>

    <div class="modal fade" id="addWordModal" tabindex="-1" role="dialog" aria-labelledby="addWordModalLabel"
         aria-hidden="true">
        <div class="modal-dialog  modal-xl" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="addWordModalLabel">Add word</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body ">
                    <form method="post" action="/word/save">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                        <div class="form-group row ml-1 mb-3">
                            <h6><label for="text" class="col-sm-2 col-form-label">Course:</label></h6>
                            <div class="col-sm-3">
                                <select name="course_id" id="course_id" class="custom-select" required>
                                    <option hidden disabled selected value>Chose course</option>
                                    <#if courses?has_content>
                                        <#list courses as course>
                                            <option id="course_id" value="${course.id}">${course.name}</option>
                                        </#list>
                                    </#if>
                                </select>
                            </div>
                            <h6><label for="text" class="col-sm-2 col-form-label">Bel:</label></h6>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="langFirst" name="langFirst" value=""
                                       placeholder="word on belarusian" required>
                            </div>
                            <h6><label for="text" class="col-sm-2 col-form-label">Eng:</label></h6>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="langSecond" name="langSecond" value=""
                                       placeholder="word on english" required>
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <div class="row justify-content-center mt-3">
                                <button type="submit" class="btn btn-primary ">add</button>
                            </div>
                        </div>
                    </form>
                    <#if words?has_content>
                        <table class="table table-sm pb-5 pt-3 table-striped">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Course</th>
                                <th scope="col">Word</th>
                                <th scope="col"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list words as word>
                                <tr>
                                    <th scope="row">${word?counter}</th>
                                    <td>${word.course.name}</td>
                                    <td>${word.langFirst} - ${word.langSecond}</td>
                                    <td>
                                        <form method="post" action="/word/delete">
                                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                            <input type="text" class="form-control" id="id-${word.id}" name="id"
                                                   value="${word.id}" readonly hidden>
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