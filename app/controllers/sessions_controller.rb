class SessionsController < ApplicationController

    def login
        @user = User.new
    end

    def create
        @user = User.find_by("username = ?", getParams[:username])

        if @user.present? && @user.authenticate(getParams[:password])
            cookies.permanent.signed[:account_id] = @user.id
            redirect_to root_path
        else
            render :login
        end
    end

    def logout
        cookies.delete(:account_id)
        redirect_to root_path
    end
    
    private
    def getParams
        params.require(:user).permit(:username, :password, :fullname)
    end
end
