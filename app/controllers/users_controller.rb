class UsersController < ApplicationController

    def index
    end

    def login
    end

    def register 
        @user = User.new
    end

    def create
        @user = User.new(getParams)
        if @user.save
            redirect_to login_path
        else
            render "register"
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(getParams)
        path = users_path
        role = current_account.status
        if role=='admin'
            path = all_users_path
        end
        redirect_to path
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to all_users_path
    end
   
    private
    def getParams
        params.require(:user).permit(:username, :password, :fullname, :status)
    end

end