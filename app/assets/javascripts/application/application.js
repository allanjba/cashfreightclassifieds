// application 

$( document ).on('turbolinks:load', function() {

  console.log("Main Apllication");
  $('.ui.dropdown').dropdown();
  
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

  $('.auctionInput').hide();
  $('.buyItInput').hide();

  // Checking if auction checkbox is checked
  $('#product_is_auction').on('click', function(){
    if($('#product_is_auction').is(':checked')) {
      console.log('Auction Yes');
      $('.auctionInput').transition('fade down');
    } else {
      console.log('Auction No');
      $('.auctionInput').transition('fade down');
    }
  });

  // Checking if buy it now checkbox is checked
  $('#product_is_sale').on('click', function(){
    if($('#product_is_sale').is(':checked')) {
      console.log('Buy it Yes');
      $('.buyItInput').transition('fade down');
    } else {
      console.log('Buy it No');
      $('.buyItInput').transition('fade down');
    }
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
