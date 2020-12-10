class TripsController < ApplicationController
	before_action :set_trip, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_admin! , except: [:show, :index, :cancel ]
	
	def index
		
		@trip = Trip.all.order(horario: :desc)
		if (current_chofer)
			@trip = Trip.where(chofer_id: current_chofer.id).where("horario > ?", Time.current()).order(horario: :asc)
		end
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
		trip = Trip.find(params[:id])
		if Order.tiene_viaje(params[:id]).exists?
			redirect_to trips_path, alert: 'El viaje tiene pasajes asignados.'
		else	
		trip.destroy
		redirect_to trips_path, notice: 'Viaje eliminado'
		end
	end


#tiene un bug todavia no verifica bien los criterios como en el create..

  	def update
  		@trip = Trip.find(params[:id])
  		
  		if trip_params[:chofer_id].to_i != @trip.chofer_id and Trip.tiene_chofer_dia(trip_params["chofer_id"],trip_params["horario"]).exists?	
			redirect_to edit_trip_path, alert: 'El chofer no esta disponible en esa fecha, seleccione otro chofer'
		
		elsif trip_params[:bus_id].to_i != @trip.bus_id and Trip.tiene_combi_dia(trip_params["bus_id"],trip_params["horario"]).exists?	
			redirect_to edit_trip_path, alert: 'La combi no esta disponible en esa fecha, seleccione otra combi'
		
		else @trip.update(trip_params)
			redirect_to trips_path , notice: 'Viaje modificado correctamente.' 
		end	

  	end
  def cancel
  	@Trip = Trip.find(params[:viaje])
 	if @Trip.undiscarded?
	 	@orders = @Trip.orders
	 	@orders.each do |order|
	 		order.refunded = order.cobro;
	 		byebug
	 		order.save
	 	end
	  	@Trip.discard
	  	redirect_to trips_path, notice: "El viaje fue cancelado, el dinero fue devuelto y usted es un IRRESPONSABLE"
  	else
  		redirect_to trips_path, notice: "El viaje ya se encuentra cancelado."
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

