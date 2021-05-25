// Messages 
$( document ).on('turbolinks:load', function() {

  console.log("Messages");
  $('.ui.dropdown').dropdown();

  document.getElementById("message-form").scrollIntoView();

  $('#message-form').submit(function(){
    length = $('#span-body').html().length;
    if ( length < 1) {
      console.log("false")
    }else {
      val = $('#span-body').html();
      $('#body').val(val);
    }
  });
  

  // menu mobile
  $(window).on('turbolinks:load resize', function(){
      var win = $(this); //this = window
      // if (win.height() >= 820) { /* ... */ }
      scrollableMessages();

      if (win.width() <= 600) { 
        addMobile();
        setTimeout(() => { offsetNavigationList(); }, 200);
        $('.header nav header').click( function(){
          $(this).parent().addClass('hover');
        });
         // closes on mobile
        $('.header nav ul').after().click( function(){
            $(this).parent().removeClass('hover');
        });
      }
      if (win.width() > 600) { 
        removeMobile();
        // removes offsetNavigationList if not mobile
        removeInlineStyles();
        $('.header nav header').hover( function(){
          $(this).parent().addClass('hover');
        });
      }
  });

// functions
  function scrollableMessages() {
    if ($(".messageList").height() > window.innerHeight - 182) {
      $(".messageList").height( window.innerHeight - 182 );
      $(".messageList").css("overflow"," hidden scroll");
    }else {
      $(".messageList").height( window.innerHeight - 182 );
      $(".messageList").removeAttr("style");
    }
  }


  function removeMobile() {
    $('.header nav ul').removeClass('mobile');

  }
  function addMobile() {
    $('.header nav ul').addClass('mobile');
  }
  // force left for menu on mobile
  function offsetNavigationList() {
    $('ul.mobile').each(function(index) {
      $(this ).offset({top:48,left:0});
    });
  }
  function removeInlineStyles() {
    $('.dashboard.header ul').removeAttr("style");
  }

 
})
