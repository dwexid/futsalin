class UsersController < ApplicationController

    def index
    end

    def all 
        @users = User.all
    end

    def login
        @users = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(getParams)
        if @user.save
            redirect_to root_path
        else
            render "new"
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
        render root_path
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render root_path
    end

    private
    def getParams
        params.require(:user).permit(:username, :password, :nama_lengkap)
    end

end