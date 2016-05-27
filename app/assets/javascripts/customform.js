  $( document ).ready(function() {
    console.log("Salut!");
    $('.unsubs-new input').focus(function() {
      console.log("Focus!");
      $(this).css("top", "50%")
      $(this).addClass('move-center');
      $(this).prev().addClass('move-center');
      $(this).prev().css( "opacity", "1" );
    });
    $('input').blur(function() {
      console.log("Blur!");
      $(this).prev().css( "opacity", "0.2" );
    });
});




// console.log( "ready!" );
//     $('#start-button').click(function() {
//     $(this).addClass('move-up');
//     $('#input-1').focus();
//     $('#next-button').addClass('translate-button');
//   });

//     $('#next-button').focus(function() {
//       $('#next-button').blur();
//       $('#next-button').removeClass('translate-button');
//       $('#input-2').focus();
//       name = $('#input-1 ').val();
//       $('#input-1-value').append(name);
//   });
