class BusesController < ApplicationController
	before_action :set_bus, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user! #, except: [:show, :index]


	def index
		@bus = Bus.all
		
	end	
	def new
		@bus = Bus.new
	end

	def show
		@bus = Bus.find(params[:id])
	end
	def edit
	end	

	def create
			@bus = Bus.new(bus_params)
			respond_to do |format|
				if @bus.save
					format.html { redirect_to buses_path, notice: 'La combi se agregó correctamente.' }
				else
					format.html { render :new }
				end
			end
	end	


	def update
			respond_to do |format|
				if @bus.update(bus_params)
					format.html { redirect_to buses_path, notice: 'La combi se actualizó correctamente.' }
				else
					format.html { render :edit }
				end
			end
	end	

	def destroy
		bus = Bus.find(params[:id])
		if Trip.tiene_combi(params[:id]).exists?	
			redirect_to buses_path, alert: 'La combi tiene un viaje asociado activo.'
		else
			bus.destroy
			redirect_to buses_path, notice: 'La combi se elimino correctamente'
		end	
	end
	

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus
    	@bus = Bus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bus_params
    	params.require(:bus).permit(:patente, :tipo, :asientos)
    end




end

