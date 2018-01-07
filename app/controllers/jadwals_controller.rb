class JadwalsController < ApplicationController

    def get_jadwal
        @id_lapang = params[:id_lapang]
        @tgl = params[:tgl]
        @jdw = ['','','','','']
        a = 6;
        b = 7;
        for i in 0..20 
            @jdw[i] = Jadwal.select('users.fullname, jadwals.*').joins('inner join users on jadwals.id_user=users.id').where('id_lapang=? and tgl=? and (beg_time=? or end_time=?)',@id_lapang,@tgl,a,b).first
            a+=1;
            b+=1;

            if a==24
                a=0
                b=1
            end
        end
        respond_to do |format|
            format.html{redirect_to jadwals_path}
            format.js
        end
    end

    def update
        @jadwal = Jadwal.find(params[:id])
        @jadwal.status = 1;
        @jadwal.save
        redirect_to flash[:url]
    end

    def create
        tempat = flash[:tempat]
        id_lap = flash[:id_lap]
        if account_signed_in?
            @jadwal = Jadwal.new(getParams.merge(:status => 0))
            if(@jadwal.save)
                flash[:success] = "Permintaan booking berhasil, silahkan tunggu verifikasi dari penyedia !!"
                redirect_to show_lapang_as_member_path(tempat,id_lap)
            end
        elsif
            flash[:notice]="Silahkan login terlebih dahulu !!"
            redirect_to login_path
        end
    end

    def destroy
        @jadwal = Jadwal.find(params[:id])
        @jadwal.destroy
    end

    private 
    def getParams
        params.require(:jadwal).permit(:id_user, :id_owner, :id_lapang, :tgl, :beg_time, :end_time)
    end

end