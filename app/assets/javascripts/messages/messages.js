// Messages 
$( document ).on('turbolinks:load', function() {

  console.log("Messages");
  $('.ui.dropdown').dropdown();

  // menu mobile
  $(window).on('turbolinks:load resize', function(){
      var win = $(this); //this = window
      // if (win.height() >= 820) { /* ... */ }
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
