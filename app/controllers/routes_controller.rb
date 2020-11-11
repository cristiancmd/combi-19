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
		@route = Route.find(params[:id])
	end
	def create
		params.require(:route).permit(:inicio, :destino)
		ini = City.find(params[:route][:inicio])
		desti = City.find(params[:route][:destino])
		@route = Route.new(inicio: ini.nombre, destino: desti.nombre)

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

	def update
		@route = Route.find(params[:id])
  		respond_to do |format|
  		if @route.update(params.require(:route).permit(:inicio, :destino))
  			format.html { redirect_to routes_path, notice: 'La ciudad se actualizo correctamente.' }
  		else
  			format.html { render :edit }
  		end
  	end
  	end
end
