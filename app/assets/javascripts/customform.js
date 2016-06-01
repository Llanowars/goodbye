  $( document ).ready(function() {

    $('input:radio').removeAttr('checked');


    $.fn.moveMid = function(){
      console.log('move mid')
      $(this).addClass('mid-pos')
    };

    $.fn.moveTop = function(){
      console.log('move top');
      $(this).addClass('top-pos');
    };

    $('fieldset input:text').focus(function() {
      $(this).parent().moveMid();
      $(this).parent().prev().moveTop();
    });

    $('fieldset div input').focus(function() {
      $(this).parent().parent().moveMid();
      $(this).parent().parent().prev().moveTop();
      preview_data = ($(this).parent().parent().prev().children('input').val());
      $('#preview-infos').append('<li class="preview-data">' + preview_data + '</li>')
    });

    $('fieldset input:submit').focus(function() {
      $(this).parent().moveMid();
      $(this).parent().prev().moveTop();
    });

    $('fieldset').first().moveMid();
    $('fieldset input:text').first().focus();




    $('.next-button').click(function () {
      console.log('click click normal')
      $(this).parent().moveTop();
      $(this).parent().nextAll(":visible").first().moveMid();
      $(this).parent().nextAll(":visible").first().children('input').focus();
      preview_data = ($(this).parent().children('input').val());
      preview_label = ($(this).parent().children('label').text());
      $('#preview-infos').append('<li class="preview-data" data-name="' + $(this).parent().children('input').attr('name') +'">' + '<span class="preview-label"' +  preview_label + ':' + '</span>' + preview_data +  '<i class="fa fa-pencil" aria-hidden="true"></i>' + '</li>')
    });



    $('.next-button-radio').click(function () {
      console.log('click click radio')
      var radio_id =  $(this).parent().find('input:checked').attr('id')
      if ($('#' + radio_id).parent().hasClass('no_sublevel')) {
        console.log('found u no sublevel')
        $(this).parent().moveTop();
        $(this).parent().nextAll(":visible").first().moveMid();
      }
      else {
        $(this).parent().moveTop();
        $('.' + radio_id).show("fast", function() {
          $(this).moveMid();
        });
      }

    });


    $('#preview-infos').on('click', "li", function() {
      console.log("click preview data", $("input[name='" + $(this).data("name") + "']"));
      if  ($("input[name='" + $(this).data("name") + "']")) {
        console.log("found you again")
      }
    })

    // $(".has_sublevel input:radio").change( function() {
    //   if ($(this).is(":checked")) {
    //     console.log('show')
    //     if  ($(this).parent().next().attr('class').indexOf(($(this).attr('id'))) > -1)  {
    //       console.log('found you !')
    //       $(this).parent().next().removeClass('hidden');

    //     }
    //   }
    // });


    // $("input:radio").click( function() {
    //   console.log("click radio");
    //   $(this).parent().parent().find('fieldset').addClass('hidden')
    //   $(this).parent().next('.has_sublevel').next('fieldset div input:radio').removeAttr('checked');
    // });

   // $(".has_sublevel input:radio").each(function(){
   //    var classInput = $(this).attr('id');
   //    $(this).parent().next().addClass(classInput)
   //  })


});



// if  ($(this).parent().next().attr('class').indexOf(($(this).attr('id'))) > -1)  {
        //   console.log('found you !')
        //   $(this).parent().next().removeClass('hidden');
        //   $(this).parent().next().moveMid();
        // }


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
