App.notification = App.cable.subscriptions.create("Noticed::NotificationChannel", {

    connected: function() {

    },
    disconnected: function() {
      
    },
    received: function(data) {
      $.get( "/notifications/nav-show");
      
    }
  });