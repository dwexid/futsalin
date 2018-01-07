class OwnersController < ApplicationController

    #before_action :require_owner_login
    layout 'logged_in'

    def index
        id_user = current_account.id
        @tempat = Owner.where("id_user = ?",id_user)
        render layout: 'application'
    end

    def order
        @notif = getNotif(params[:id_owner])
        @orders = Jadwal.select('owners.nama_tempat,jadwals.*').joins('inner join owners on jadwals.id_owner=owners.id').where("id_owner=? and status=?", params[:id_owner],0)
    end

    def show
        @notif = getNotif(params[:id_owner])
        @tempat = Owner.find(params[:id_owner])
        @lapangs = Lapang.where("id_owner = ?",@tempat.id)
    end

    def new
        @tempat = Owner.new
        render layout: 'application'
    end

    def create 
        id_user = current_account.id
        @tempat = Owner.new(getParams.merge(:id_user => id_user))
        if @tempat.save
            redirect_to owner_dashboard_path
        else 
            redirect_to new_owner_path
        end
    end

    def edit
        @tempat = Owner.find(params[:id])
        render layout: 'application'
    end

    def update
        @tempat = Owner.find(params[:id])
        @tempat.update(getParams)
        redirect_to manage_tempat_path(params[:id])
    end

    def destroy
    end

    private
    def getParams
        params.require(:owner).permit(:nama_tempat,:alamat,:kontak,:image)
    end

    private 
    def getNotif(id)
        @notif = Jadwal.where('id_owner=? and status=?',id,0).count
    end
    
    private
    def require_owner_login
        if current_account.status!='owner'
            redirect_to login_path
        end
    end

end
 