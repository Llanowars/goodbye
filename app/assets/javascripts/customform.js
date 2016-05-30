  $( document ).ready(function() {
    console.log("Salut c'est cool!");
    $('.unsubs-new .custom-form input').first().parent().addClass('move-bot-mid');
    $('.unsubs-new .custom-form input').last().parent().addClass('test');
    $('.unsubs-new .custom-form input').first().parent().removeClass('initial-pos');

    $('.unsubs-new .custom-form input').first().focus();

    $('.unsubs-new .custom-form input').focus(function() {
      if ( $( this ).parent().hasClass( 'initial-pos' ) ) {
        $(this).parent().removeClass('initial-pos');
        $(this).parent().addClass('move-bot-mid');
      }
      else if ( $( this ).parent().hasClass('move-mid-top') ) {
        $(this).parent().removeClass('move-mid-top');
        $(this).parent().addClass('move-top-mid');
      }
    });

    $('.unsubs-new .custom-form input').blur(function() {
      if ( $( this ).parent().hasClass( 'move-bot-mid' ) ) {
        $(this).parent().removeClass('move-bot-mid');
        $(this).parent().addClass('move-mid-top');
        name = $(this).val();
        $('#preview-letter').append("<li>" + name + "</li>");
        $(this).parent().next().focus;

      }
      else if ( $( this ).parent().hasClass('move-top-mid') ) {
        $(this).parent().removeClass('move-top-mid');
        $(this).parent().addClass('move-mid-top');
      }
    });

    $('.upload-file input').focus(function() {
      $(this).parent().removeClass('initial-pos');
      $(this).parent().addClass('move-bot-mid');
    });

    $('.upload-file input').blur(function() {
      $(this).parent().removeClass('move-bot-mid');
      $(this).parent().addClass('move-mid-top');
    });

    $('.validate-form ').focus(function() {
      $(this).removeClass('initial-pos');
      $(this).addClass('move-bot-mid');
    });

    $('.radio_clickable_div').on('click', function() {
      $('#hidden_field').val($(this))
    });

    $('#next-button').focus(function() {
      $(this).blur();
      $(this).prev().blur();
      $(this).parent().next().find('input').focus();
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
