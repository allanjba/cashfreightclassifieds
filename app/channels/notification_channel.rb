class NotificationChannel < ApplicationCable::Channel


    def subscribed
      stream_for current_user
    end
  
    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end

    def mark_as_read(data)
      current_user.notifications.where(id: data["ids"]).mark_as_read!
    end

  end
