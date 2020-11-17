class RoutesController < ApplicationController
	before_action :authenticate_user! #, except: [:show, :index]

	def index
		@route = Route.all
	end

	def show
		@route = Route.find(params[:id])
	end

	def new
		if not City.any?
			redirect_to cities_path , alert: 'Debe crear ciudades para poder crear rutas' 
		else
			@route = Route.new
		end
	end

	def edit
		@route = Route.find(params[:id])
	end

	def create
		@route = Route.new(route_params)
		# mal @route.nombre = @route.initial_city.nombre + ' - ' + @route.destination_city.nombre

		#CHECK SI INICIO Y DESTINO SON IGUALES
		if @route.initial_city_id==@route.destination_city_id
			redirect_to new_route_path , alert: 'Las ciudades de origen y destino deben ser diferentes'		
		#CHECK SI EXISTE UNA RUTA IGUAL
		elsif Route.where(initial_city: @route.initial_city, destination_city: @route.destination_city, duracion: @route.duracion).exists?
			redirect_to new_route_path , alert: 'La ruta ya existe'
		#CREA LA RUTA
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
		if Trip.tiene_ruta(params[:id]).exists?
			redirect_to routes_path, alert: 'La ruta tiene un viaje asociado activo.'
		else
			route.destroy
			redirect_to routes_path , notice: 'La ruta se elimino correctamente'
		end	
	end


	def update
		@route = Route.find(params[:id])
		#CHECK SI INICIO Y DESTINO SON IGUALES
		if route_params["initial_city_id"]==route_params["destination_city_id"]
			redirect_to new_route_path , alert: 'Origen y destino deben ser diferentes!'
		#CHECK SI EXISTE UNA RUTA IGUAL
		elsif Route.where(initial_city: route_params["initial_city_id"], destination_city: route_params["destination_city_id"], duracion: route_params["duracion"]).exists?
			redirect_to edit_route_path , alert: 'La ruta ya existe'
		#ACTUALIZA LA RUTA
		else
			respond_to do |format|
				if @route.update(route_params)
					format.html { redirect_to routes_path, notice: 'La ruta se actualizo correctamente.' }
				else
					format.html { render :edit , notice: 'Hubo un error' }
				end
			end
		end

	end

	private
		def route_params
			params.require(:route).permit(:initial_city_id, :destination_city_id, :duracion)
		end

	
end




