class ConversationsController < ApplicationController

    before_action :authenticate_user!
    layout "inbox"

    def index
        @conversations = filterConversations
    end

    def show
        @conversations = filterConversations
        @conversation = current_user.mailbox.conversations.find(params[:id])
        @conversation.mark_as_read(current_user)
        @user = from(@conversation, current_user)
        notifications = current_user.notifications.where('params @> ?', {conversation: @conversation.id}.to_json)  
        notifications.mark_as_read!
        respond_to do |format|
            format.html
            format.js
        end
    end

    def new
        @conversations = filterConversations
        @recipient = User.find(params[:user_id])
        @conversation = current_user.mailbox.conversations.between( current_user, @recipient ).first
        if @conversation.present?
            redirect_to conversation_path(@conversation)
        else
            @recipient = User.find(params[:user_id])   
        end
    end

    def create
        recipient = User.find(params[:user_id])
        receipt = current_user.send_message(recipient, params[:body], "no-subject")  
        redirect_to conversation_path(receipt.conversation)
        # deliver methods
        MessageNotification.with({conversation: receipt.conversation.id, user: current_user}).deliver_later(from(receipt.conversation, current_user))
    end
    def read
        @conversation = current_user.mailbox.conversations.find(params[:id])
        @conversation.mark_as_read(current_user)
        respond_to do |format|
            format.js
        end
    end

    # check convercetion for sender
    def from(conversation, current_user)
        participants = conversation.participants - [current_user]
        participant = participants.first
        return participant
    end


    helper_method :from

    private

    # filter for conversations where the user still active
    def filterConversations
        conversations = current_user.mailbox.conversations
        conversations.each do |conversation|
            if conversation.participants.size  == 1
                conversations = conversations - [conversation]
            end
        end
        return conversations
    end


end