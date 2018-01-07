class HomeController < ApplicationController

    def index
        @owners = Owner.limit(8)
    end

    def browse_all
        @owners = Owner.all
    end
    
    def show
        @tempat = Owner.find(params[:id])
        @lapangs = Lapang.where("id_owner = ?",@tempat.id)
    end

end