document.addEventListener('turbolinks:load', () =>{

  element = document.getElementById("conversation-id");
  conv_id = element.getAttribute('data-conversation-id');
  user_id = $('#data-user-id').data("user-id");
  
  App.conversation = App.cable.subscriptions.create({channel: "ConversationChannel", conversation_id: conv_id} , {
  
      connected: function() {
        console.log("connected");
  
      },
      disconnected: function() {
        
      },
      received: function(data) {
        if  ($(`#conversation-id[data-conversation-id='${data.conversation}']` ).length > 0) {
          console.log(data.conversation);
        if (data.user == user_id){
          my_messages = "my-messages"
        }else {
          my_messages = ""
        }
        $(`#conversation-id[data-conversation-id='${data.conversation}']` ).append( "<div class='message "+my_messages+"'><span>"+data.body+ "</span></div>");
        document.getElementById("message-form").scrollIntoView();
        $.get( "/conversations/read/"+data.conversation);
        }

      }
  });

})

