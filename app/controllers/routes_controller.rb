class RoutesController < ApplicationController

	def index
		@route = Route.all
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
		
    	@route = Route.new(params.require(:route).permit(:inicio_city_id, :destino_city_id))
		
		respond_to do |format|
			if @route.save
				format.html { redirect_to routes_path , notice: 'Ruta creada exitosamente.' }
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
			if @route.update(params.require(:route).permit(:inicio_city_id, :destino_city_id))
				format.html { redirect_to routes_path, notice: 'La ruta se actualizo correctamente.' }
			else
				format.html { render :edit , notice: 'Hubo un error' }
			end
		end
	end
end
