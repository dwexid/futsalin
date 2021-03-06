class AdminController < ApplicationController

  layout 'admin'

  def index
    @member = User.where('status=?','member').count
    @owner = Owner.count
    @lapang = Lapang.count
  end

  def all
    @users = User.all
    @content_title = 'All User'
    render 'users' 
  end

  def members
    @users = User.where(status: 'member')
    @content_title = 'Data Member'
    render 'users'
  end

  def admins
    @users = User.where(status: 'admin')
    @content_title = 'Data Admin'
    render 'users'
  end

  def owners
    @owners = Owner.select("owners.*, users.fullname").joins("inner join users on owners.id_user=users.id").order(:id_user)
    @content_title = 'Data Owner'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to all_users_path
  end
  
end
