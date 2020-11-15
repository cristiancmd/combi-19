class RoutesController < ApplicationController
	before_action :authenticate_user! #, except: [:show, :index]

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
    	@route = Route.new(route_params)
    	
    	if Route.where(initial_city: @route.initial_city, destination_city: @route.destination_city).exists?
    		redirect_to routes_path , alert: 'La ruta ya existe'
    	else
			respond_to do |format|
				if @route.save
					format.html { redirect_to routes_path , notice: 'Ruta creada exitosamente.' }
				else
					format.html { render :new }
				end
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
			if @route.update(route_params)
				format.html { redirect_to routes_path, notice: 'La ruta se actualizo correctamente.' }
			else
				format.html { render :edit , notice: 'Hubo un error' }
			end
		end
	end
private
	def route_params
		params.require(:route).permit(:initial_city_id, :destination_city_id)
	end

end
