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
  
  
})
  
  