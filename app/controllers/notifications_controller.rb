class NotificationsController < ApplicationController

    def index
        @notifications = current_user.notifications
        
    end

    def nav_show
        @conversations = current_user.mailbox.conversations
        respond_to do |format|
            format.js
        end
    end

    def read 
        @notification = current_user.notifications.find(params[:id])
        @notificationSize = current_user.notifications.where.not(type: 'MessageNotification').unread.size - 1
        
        respond_to do |format|
            if @notification.mark_as_read!
                format.js
            end
        end
    end

    # check convercetion for sender
    def from(conversation, current_user)
        participants = conversation.participants - [current_user]
        participant = participants.first
        return participant
    end
    helper_method :from



end