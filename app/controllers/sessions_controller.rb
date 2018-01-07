class SessionsController < ApplicationController

    def login
        is_logged?
        @user = User.new
    end

    def create
        @user = User.find_by("username = ?", getParams[:username])

        if @user.present? && @user.authenticate(getParams[:password])
            cookies.permanent.signed[:account_id] = @user.id
            if @user.status=='admin'
                redirect_to admin_dashboard_path
            elsif @user.status =='owner'
                redirect_to owner_dashboard_path
            else
                redirect_to root_path
            end
        else
            flash[:notice] = "Username / Password salah !!"
            redirect_to login_path
        end
    end

    def logout
        cookies.delete(:account_id)
        redirect_to login_path
    end
    
    private
    def getParams
        params.require(:session).permit(:username, :password)
    end
    
    private
    def is_logged?
        if account_signed_in?
            redirect_to root_path
        end
    end
end
