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
		inicio = City.find(params[:route][:inicio])
		destino = City.find(params[:route][:destino])

		@route = Route.new(inicio: inicio, destino: destino)
		
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

		params.require(:route).permit(:inicio, :destino)
		inicio = City.find(params[:route][:inicio])
		destino = City.find(params[:route][:destino])
  		respond_to do |format|
  		if @route.update(inicio: inicio, destino: destino)
  			format.html { redirect_to routes_path, notice: 'La ciudad se actualizo correctamente.' }
  		else
  			format.html { render :edit }
  		end
  	end
  	end
end
