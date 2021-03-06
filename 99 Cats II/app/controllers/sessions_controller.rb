class SessionsController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
        if @user
            @user.reset_session_token = session[:session_token]
            redirect_to cats_url
        else
            render :new
        end
    end

    # def destroy
    #     render :new
    # end

end