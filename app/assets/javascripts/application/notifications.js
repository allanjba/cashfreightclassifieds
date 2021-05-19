//  loads on turbo links
$( document ).on('turbolinks:load', function() {
//  needs document function for partials after they load
$( document ).on("mouseover", "#notification-menu .notification.item.unread", function() {
        // get notification ID
        id = $(this).data("notification-id");
        // remove unread class
        $( this ).removeClass( "unread" );
        // mark notification as read
        $.get( "/notifications/read/" + id);
        
    }
  );

})
