// $(".button_match").click(function() {

//     $(this).toggle();
// });

//profile page

//modals
$(function () {
    $('#add-course-btn').on('click', function (event) {
        event.preventDefault();
        $('.addCourseModal #addCourseModal').modal();
    })
});

$(function () {
    $('#add-word-btn').on('click', function (event) {
        event.preventDefault();
        $('.addWordModal #addWordModal').modal();
    })
});

$(function () {
    $('#join-course-btn').on('click', function (event) {
        event.preventDefault();
        $('.joinCourseModal #joinCourseModal').modal();
    })
});

$(function () {
    $('#profile-edit-btn').on('click', function (event) {
        event.preventDefault();
        $('.editProfileModal #editProfileModal').modal();
    })
});

// $(document).ready(function () {
//     $(".edit-user-modal-btn").click(function (event) {
//         event.preventDefault();
//         $('.editUserProfileModal #editUserProfileModal').modal();
//     });
// });

// $(document).on('click', ".edit-user-modal-btn", function (event) {
//     event.preventDefault();
//     $('.editUserProfileModal #editUserProfileModal').modal();
// });

// $("#editUsersModal").on('click', '.edit-user-modal-btn', function (event) {
//     event.preventDefault();
//     $('.editUserProfileModal #editUserProfileModal').modal();
// });
//

let userIdForEdit = 0;
let userNameForEdit = "";
let userEmailForEdit = "";


$("#editUserProfileModal").on('show.bs.modal', function (e) {
    $(".user-input-edit-id").val(userIdForEdit);
    $(".user-input-edit-name").val(userNameForEdit);
    $(".user-input-edit-email").val(userEmailForEdit);
    $("#editUsersModal").modal("hide");

});

$(function () {
    $('.btn.btn-outline-primary.edit-user-modal-btn').on('click', function (event) {
        event.preventDefault();
        userIdForEdit = $(this).attr('data-id');
        userNameForEdit = $(this).attr('data-username');
        userEmailForEdit = $(this).attr('data-email');
    })
});

$(function () {
    $('#user-courses-btn').on('click', function (event) {
        event.preventDefault();
        $('.userCoursesModal #userCoursesModal').modal();
    })
});

$(function () {
    $('#edit-user-btn').on('click', function (event) {
        event.preventDefault();
        $('#editUsersModal').modal();
    })
});

//search
$(document).ready(function () {
    $("#word-input").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("#word_table_1 tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
        $("#word_table_2 tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
        $("#word_table_3 tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });
});

/*
learn page
 */
$(document).ready(function () {
    $("#translation").css({opacity: 0});
});

$("#question_button_learn").click(function (e) {
    $("#translation").css({opacity: 1});
});

/*
match
*/
// $(".button_match").click(function (e) {
//     $(e.currentTarget).toggle();
// });
let lastClickedId = -1;
let lastClickedValue = '';

$(document).ready(function () {
    $(".button_match").click(function (event) {
        if (lastClickedId == $(this).attr('data-id') && lastClickedValue != $(this).attr('value')) {
            // alert(event.target.id + ' last:' + lastClickedId);

            var token = $("meta[name='_csrf']").attr("content");

            $.ajax({
                type: "POST",
                url: "/match",
                data: "id=" + $(this).attr('data-id'),
                headers: {"X-CSRF-TOKEN": token},
                success: function (response) {
                    $(`div[data-id=${lastClickedId}]`).each(function () {
                        $(this).hide();
                    });
                },
                error: function (e) {
                    alert('Error: ' + e);
                }
            });

        } else {
            lastClickedId = $(this).attr('data-id');

        }
    });
});

