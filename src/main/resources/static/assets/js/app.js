// $(".button_match").click(function() {

//     $(this).toggle();
// });


/*
learn page
 */
$(document).ready(function() {
    $("#translation").css({ opacity: 0 });
});

$("#question_button_learn").click(function (e) {
    $( "#translation" ).css({ opacity: 1 });
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