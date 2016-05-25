  $( document ).ready(function() {
    console.log( "ready!" );
    $('#start-button').click(function() {
    $(this).addClass('move-up');
    $('#input-1').focus();
    $('#next-button').addClass('translate-button');
  });

    $('#next-button').focus(function() {
      $('#next-button').blur();
      $('#next-button').removeClass('translate-button');
      $('#input-2').focus();
      name = $('#input-1 ').val();
      $('#input-1-value').append(name);
  });
});


