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
		if (current_chofer)
			@order = Trip.find(params[:id]).orders.where(canceled: false)  # sin viajes cancelados
		end
		
		@trip_params = Trip.find(params[:id])
		
		byebug
	end
	def new
		@trip = Trip.new
	end


	def create
		
		if (params[:trip][:horario]).empty? or (params[:trip][:chofer_id]).empty? or (params[:trip][:bus_id]).empty? or (params[:trip][:route_id]).empty? or (params[:trip][:rate]).empty? or (params[:trip][:rate]).to_i == 0
			redirect_to new_trip_path , alert: 'Debe completar todos los campos requeridos antes de guardar un viaje'

		elsif !(params[:trip][:end]).empty? && (params[:dias][:array]).reject(&:empty?).empty?
			redirect_to new_trip_path , alert: 'Debe seleccionar al menos un dia de la semana para realizar viajes recurrentes'
		elsif !(params[:trip][:end]).empty? && (params[:trip][:end]) < (params[:trip][:horario])
			redirect_to new_trip_path , alert: 'Debe seleccionar una fecha final mayor a la fecha de origen para viajes recurrentes'

		else	

			start_date = (params[:trip][:horario]).to_date
			if (params[:trip][:end]).empty?
				end_date = (params[:trip][:horario]).to_date
				my_days = [0,1,2,3,4,5,6]
			else	
				end_date = (params[:trip][:end]).to_date
					
				my_days = (params[:dias][:array]).reject(&:empty?).map(&:to_i)
			end
				fecha = (start_date..end_date).to_a.select {|k| my_days.include?(k.wday)}				
				time1 = Time.parse((params[:trip][:horario]))				
				flash[:errores] = []
				flash[:aciertos] = []
				
				fecha.each do |h|		        	
		        	d = h.to_date
		        	dt = DateTime.new(d.year, d.month, d.day, time1.hour, time1.min )
					
					datos = trip_params.merge(horario: dt)
					@trip = Trip.new(datos)
					if Trip.tiene_chofer_dia(trip_params["chofer_id"], dt  ).exists?	
						flash[:errores] << "Chofer no disponible fecha: #{dt.strftime("%-d/%-m/%y  |  %H:%M ")} "
						next			
					end
					if Trip.tiene_combi_dia(trip_params["bus_id"],  dt ).exists?					
						flash[:errores] << "Combi no disponible fecha: #{dt.strftime("%-d/%-m/%y  |  %H:%M ")} "
						next	
					end

					if @trip.save
						flash[:aciertos] << "Programacion exitosa: #{dt.strftime("%-d/%-m/%y  |  %H:%M ")}"
					end	
			end	
			redirect_to trips_path 
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
	 	if not @orders.empty?
		 	@orders.each do |order|
		 		order.refunded = order.cobro;
		 		order.canceled = true;
		 		order.save
		 	end
	 		redirect_to trips_path, notice: "El viaje fue cancelado, el dinero fue devuelto a los pasajeros"
	 	else
	 		redirect_to trips_path, notice: "El viaje no tenía pasajeros, fue descartado exitosamente"
	 	end
	  	@Trip.discard	
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
    	params.require(:trip).permit(:horario,:fecha_inicio, :bus_id, :route_id, :chofer_id, :rate, :start, :end, :fecha)
    end

end

