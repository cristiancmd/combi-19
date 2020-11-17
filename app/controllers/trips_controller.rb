class TripsController < ApplicationController
	before_action :set_trip, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user! #, except: [:show, :index]
	
	def index
		
		@trip = Trip.all

	end
	def show
		@trip = Trip.find(params[:id])
	end
	def new
		@trip = Trip.new
	end

	def create
		@trip = Trip.new(trip_params)

		respond_to do |format|
			if @trip.save
				format.html { redirect_to trips_path , notice: 'Viaje creado exitosamente.' }
			else
				format.html { render :new }
			end
		end
	end

	def edit
	end

	def destroy
	
		
	end



  def update
  	
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

