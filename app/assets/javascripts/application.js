// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require_tree .
//= require_self



  // application 

$('.ui.dropdown').dropdown();

function createAd(name, category, price, location, image, description) {
    let id = classifieds.classifiedAds.length + 1;
    classifieds.addAd(id, name, category, price, location, image, description);
}

// avatar

document.getElementById("avatar-field").onchange = function() {
  document.getElementById("form-avatar").submit();
  
};

$('form').submit(function() {
  $("#bg-load-message").toggle();
  alert('I hate tomatoes.');
});