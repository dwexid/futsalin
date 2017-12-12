class UsersController < ApplicationController

    def index
        @users = User.all
        render layout: 'admin'
    end

    def login
    end

    def register 
        @user = User.new
    end

    def create
        @user = User.new(getParams)
        if @user.save
            redirect_to users_path
        else
            render "register"
        end
    end

    def show
        @users = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(getParams)
        redirect_to users_path
    end
   
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    private
    def getParams
        params.require(:user).permit(:username, :password, :fullname, :status)
    end

end