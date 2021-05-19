App.notification = App.cable.subscriptions.create("Noticed::NotificationChannel", {

    connected: function() {

    },
    disconnected: function() {
      
    },
    received: function(data) {
      console.log("rendering");
      $.get( "/notifications/nav-show");
      
    }
  });