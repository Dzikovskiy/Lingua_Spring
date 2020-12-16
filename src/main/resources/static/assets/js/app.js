// $(".button_match").click(function() {

//     $(this).toggle();
// });


$(".button_match").click(function (e) {
    $(e.currentTarget).toggle();
});

// $(document).on('click', '.button_match', function() {
//     $(this).hide(); // hides only the element that was clicked with the class .the-class  
// })