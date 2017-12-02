class JadwalController < ApplicationController

    def index
    end

    def new
    end

    def create
        @jadwal = Jadwal.new(getParams)
        if(@jadwal.save)
            redirect_to root_path
        else
            render 'new'
        end
    end

    def show
        @jadwals = Jadwal.find(params[:id])
    end

    def edit
        @jadwal = Jadwal.find(params[:id])
    end

    def update
        @jadwal = Jadwal.find(params[:id])
        @jadwal.update(getParams)
        render root_path
    end

    def destroy
        @jadwal = Jadwal.find(params[:id])
        @jadwal.destroy
    end

    private 
    def getParams
        params.require(:jadwal).permit(:id_lapang, :tgl, :jam_start, :jam_end)
    end

end