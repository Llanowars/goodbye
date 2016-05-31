  $( document ).ready(function() {
    console.log("Salut c'est cool!");
    $('input:radio').removeAttr('checked');

    $(".has_sublevel input:radio")


    $(".has_sublevel input:radio").change( function() {
      if ($(this).is(":checked")) {
          console.log('show')
          if  ($(this).parent().next().attr('class').indexOf(($(this).attr('id'))) > -1)  {
            console.log('found you !')
            $(this).parent().next().removeClass('hidden');
          }
        }
      });

    $("input:radio").click( function() {
      console.log("click radio");
      $(this).parent().parent().find('fieldset').addClass('hidden')
      $(this).parent().next('.has_sublevel').next('fieldset div input:radio').removeAttr('checked');
    });

   $(".has_sublevel input:radio").each(function(){
      var classInput = $(this).attr('id');
      $(this).parent().next().addClass(classInput)
    })
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
