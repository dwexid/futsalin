class HomeController < ApplicationController

    def index
        @owners = Owner.limit(8)
    end

    def cari
        @cari = params[:cari]
        @kota = params[:kota]
        @owners = Owner.where("nama_tempat like ? and alamat like ?","%#{@cari}%","%#{@kota}%")
        render 'browse_all'
    end

    def notif
        @notifs = Notif.where('id_user',params[:id])
    end

    def browse_all
        @owners = Owner.all
    end
    
    def show
        @tempat = Owner.find(params[:id])
        @lapangs = Lapang.where("id_owner = ?",@tempat.id)
    end

end