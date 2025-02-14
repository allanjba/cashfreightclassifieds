// application 
// load js fontawesome for pseudo elements
window.FontAwesomeConfig = {
  searchPseudoElements: true
}

$( document ).on('turbolinks:load', function() {

  

  // open main menu on mobile
  $('.nav-icon').click( function(){
    $(this).parent().addClass('hover');
  });
  // Close main menu on mobile
  $('.main.nav.mobile ul').after().click( function(){
    $(this).parent().removeClass('hover');
  });

  
  $('.ui.dropdown').dropdown();
  $('.ui.circular.label').dropdown();
  function createAd(name, category, price, location, image, description) {
      let id = classifieds.classifiedAds.length + 1;
      classifieds.addAd(id, name, category, price, location, image, description);
  }

  
  // avatar
  $('#avatar-field').change(function() {
    $("#form-avatar").submit();
  });
  
  $("form").on('submit', function() {
    $("#bg-load-message").toggle();
  });

  // Checking which listing type is checked and show input
  if($('#product_is_auction').is(':checked')) {
    $('.auctionInput').show();
  } else {
    $('.auctionInput').hide();
  }

  if($('#product_is_sale').is(':checked')) {
    $('.buyItInput').show();
  } else {
    $('.buyItInput').hide();
  }

  // Checking if auction checkbox is checked
  $('#product_is_auction').on('click', function(){
    if($('#product_is_auction').is(':checked')) {
      $('.auctionInput').transition('fade down');
    } else {
      $('.auctionInput').transition('fade down');
    }
  });

  // Checking if buy it now checkbox is checked
  $('#product_is_sale').on('click', function(){
    if($('#product_is_sale').is(':checked')) {
      $('.buyItInput').transition('fade down');
    } else {
      $('.buyItInput').transition('fade down');
    }
  });
  
  $('#product_images').change(function () {
    var a = $('#product_images').val().toString().split('\\');
    $('#fakeInput').val(a[a.length -1]);
  });
  
})
// Timer for auction
// Set the date we're counting down to

var countDownDate = new Date("Jan 5, 2022 15:37:25").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

  // Get today's date and time
  var now = new Date().getTime();

  // Find the distance between now and the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Display the result in the element with id="demo"
  $(".timeRemaining").html(`${days} days ${hours} hrs ${minutes} min ${seconds} sec |`);

  // If the count down is finished, write some text
  if (distance < 0) {
    clearInterval(x);
    $(".timeRemaining").html("EXPIRED");
  }
}, 1000);

// Mobile  
$(window).on('turbolinks:load resize', function(){
  var win = $(this);

  if (win.width() <= 600) { 

    
  }
  if (win.width() > 600) { 

  }
});