class DashboardController < ApplicationController
  before_action :authenticate_admin!





  def index
   
  end

  def users
    @users = User.all
  end

  def categories
    
  end

  private

  def authenticate_admin!
    if current_user
      if !current_user.admin? 
        redirect_to root_path, alert: 'Sorry, your user must have administrator rights to access this page.'
      end
    else
      redirect_to new_user_session_path, alert: 'You must sign in as administrator to access this page.'
    end
  end

end
