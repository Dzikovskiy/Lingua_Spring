<#macro modal>

    <div class="modal fade" id="userCoursesModal" tabindex="-1" role="dialog" aria-labelledby="userCoursesModalLabel"
         aria-hidden="true">
        <div class="modal-dialog  modal-xl" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="userCoursesModalLabel">Your courses</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body ">
                     <#if userCourses?has_content>
                         <#list userCourses as course>
                    <div class="card ml-5 my-5" style="max-width: 970px;">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img src="/static/assets/img/course_picture.jpg" alt="" width="240" height="250">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">${course.name}</h5>
                                    <div id="accordion">
                                        <div class="card">
                                            <div class="card-header" id="heading${course.id}">
                                                <h5 class="mb-0">
                                                    <button class="btn btn-link" data-toggle="collapse"
                                                            data-target="#collapse${course.id}" aria-expanded="false"
                                                            aria-controls="collapse${course.id}">
                                                        Words in course
                                                    </button>
                                                </h5>
                                            </div>
                                            <div id="collapse${course.id}" class="collapse" aria-labelledby="heading${course.id}"
                                                 data-parent="#accordion">
                                                <div class="card-body">
                                                    <table class="table table-striped">
                                                        <thead>
                                                        <tr>
                                                            <th scope="col">#</th>
                                                            <th scope="col">word</th>
                                                            <th scope="col">translation</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <#list course.words as word>
                                                        <tr>
                                                            <th scope="row">${word?counter}</th>
                                                            <td>${word.langFirst}</td>
                                                            <td>${word.langSecond}</td>
                                                        </tr>
                                                        </#list>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                         </#list>
                     <#else>
                         <div class="col-sm-8 mx-auto">
                             <h1 class="my-5 ">Join some courses</h1>
                         </div>
                     </#if>
                </div>
            </div>
        </div>
    </div>

</#macro>