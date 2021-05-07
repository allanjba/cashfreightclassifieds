class ConversationsController < ApplicationController

    before_action :authenticate_user!
    layout "inbox"

    def index
        @conversations = filterConversations
    end

    def show
        @conversations = filterConversations
        @conversation = current_user.mailbox.conversations.find(params[:id])
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
        receipt = current_user.send_message(recipient, params[:body], params[:subject])  
        redirect_to conversation_path(receipt.conversation)
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