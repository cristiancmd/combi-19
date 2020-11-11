class RoutesController < ApplicationController
	def index
		@routes = Route.all
	end
	def show
		@routes = Route.find(params[:id])
	end
	def new
		@route = Route.new
	end
	def edit
		@route = Route.new
	end
	def create
		inicio = params.require(:route).permit(:inicio)
		destino = params.require(:route).permit(:destino)
		a = City.find(inicio)
		b = City.find(destino)
		@route = Route.new(inicio: a, destino: b)

		respond_to do |format|
			if @route.save
				format.html { redirect_to routes_path , notice: 'Ciudad creada.' }
			else
				format.html { render :new }
			end
		end
	end
	def destroy
		route = Route.find(params[:id])
		route.destroy
		redirect_to routes_path
	end


private
	  # Only allow a list of trusted parameters through.
    def city_params
    end
end
