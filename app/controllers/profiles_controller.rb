class ProfilesController < ApplicationController

    def def show
        @user = User.find(params[:id]) 
    end

end
