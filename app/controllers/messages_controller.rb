class MessagesController < ApplicationController
    before_action :set_conversation

    def create 
        @receipt = current_user.reply_to_conversation(@conversation, params[:body])
        
        respond_to do |format|
            format.html { redirect_to conversation_path(@receipt.conversation) }
            format.js
            MessageNotification.with({conversation: @conversation.id, user: current_user}).deliver_later(from(@conversation, current_user))
        end
    end

    private

    def set_conversation
        @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
    end

    def from(conversation, current_user)
        participants = conversation.participants - [current_user]
        participant = participants.first
        return participant
    end
end