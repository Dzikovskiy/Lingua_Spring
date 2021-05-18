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

$(function () {
    $('#user-courses-btn').on('click', function (event) {
        event.preventDefault();
        $('.userCoursesModal #userCoursesModal').modal();
    })
});

//search
$(document).ready(function(){
    $("#word-input").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#word_table_1 tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
        $("#word_table_2 tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
        $("#word_table_3 tr").filter(function() {
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
$(".button_match").click(function (e) {
    $(e.currentTarget).toggle();
});


// $(document).on('click', '.button_match', function() {
//     $(this).hide(); // hides only the element that was clicked with the class .the-class  
// })