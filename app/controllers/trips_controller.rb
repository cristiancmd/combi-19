class TripsController < ApplicationController
	before_action :set_trip, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user! #, except: [:show, :index]
	
	def index
		
		@trip = Trip.all.order("horario ASC")

	end
	def show
		@trip = Trip.find(params[:id])
	end
	def new
		@trip = Trip.new
	end

	def create
		@trip = Trip.new(trip_params)
		if 	Trip.tiene_chofer_dia(trip_params["chofer_id"],trip_params["horario"]).exists?	
			redirect_to new_trip_path, alert: 'El chofer no esta disponible en esa fecha, seleccione otro chofer'
		
		elsif Trip.tiene_combi_dia(trip_params["bus_id"],trip_params["horario"]).exists?	
			redirect_to new_trip_path, alert: 'La combi no esta disponible en esa fecha, seleccione otra combi'
		else	
			respond_to do |format|
				if @trip.save
					format.html { redirect_to trips_path , notice: 'Viaje creado exitosamente.' }
				else
					format.html { render :new }
		 		end
			end
		end	
	end

	def edit
		@trip = Trip.find(params[:id])
	end

	def destroy
	
		
	end



  	def update
  		@trip = Trip.find(params[:id])
  		if 	Trip.tiene_chofer_dia(trip_params["chofer_id"],trip_params["horario"]).exists?	
			redirect_to edit_trip_path, alert: 'El chofer no esta disponible en esa fecha, seleccione otro chofer'
		
		elsif Trip.tiene_combi_dia(trip_params["bus_id"],trip_params["horario"]).exists?	
			redirect_to edit_trip_path, alert: 'La combi no esta disponible en esa fecha, seleccione otra combi'
		
		else @trip.update(trip_params)
			redirect_to trips_path , notice: 'Viaje modificado correctamente.' 
		end	

  	end
  

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
    	@trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
    	params.require(:trip).permit(:horario,:fecha_inicio, :bus_id, :route_id, :chofer_id, :rate)
    end

end

