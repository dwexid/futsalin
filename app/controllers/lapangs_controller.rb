class LapangsController < ApplicationController

    layout 'logged_in'

    def index
    end

    def new
        @lapang = Lapang.new
    end

    def show
        @notif = Jadwal.where('id_owner=? and status=?',params[:id],0).count
        @lapang = Lapang.find(params[:id])
        @jdw = ['','','','','']
        a = 6;
        b = 7;
        for i in 0..20 
            @jdw[i] = Jadwal.select('users.fullname, jadwals.*').joins('inner join users on jadwals.id_user=users.id').where('id_lapang=? and tgl=? and (beg_time=? or end_time=?)',@lapang.id,Time.now.strftime("%Y-%m-%d"),a,b).first
            a+=1;
            b+=1;

            if a==24
                a=0
                b=1
            end
        end

        @jadwal_new = Jadwal.new

        if params[:id_owner]
            render layout: 'application'
        end
    end

    def naon
        @text = 'Naon arimaneh'

        respond_to do |format|
            format.html{redirect_to naon_path}
            format.js
        end
    end
    
    def create
        @lapang = Lapang.new(getParams)
        if @lapang.save
            redirect_to owner_dashboard_path
        else
            render "register"
        end
    end

    def edit
        @lapang = Lapang.find(params[:id])
    end

    def update
        @lapang = Lapang.find(params[:id])
        @lapang.update(getParams)
        redirect_to flash[:url]
    end
    
    def destroy
        @lapang = Lapang.find(params[:id])
        @lapang.destroy
        redirect_to root_path
    end
    
    private
    def getParams()
        params.require(:lapang).permit(:image, :id_owner, :nama_lapang, :jenis, :harga_perjam)
    end
end