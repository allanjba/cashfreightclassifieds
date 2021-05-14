
$( document ).on('turbolinks:load', function() {

$( "#notification-menu .notification.item.unread" ).hover(
    function() {
        // get notification ID
        id = $(this).data("notification-id");
        // remove unread class
        $( this ).removeClass( "unread" );
        // mark notification as read
        $.get( "/notifications/read/" + id);
        
    }
  );

})