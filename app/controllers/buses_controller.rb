class BusesController < ApplicationController
		before_action :authenticate_user! #, except: [:show, :index]

	def index
		@buses = Bus.all()
	def new
		@bus = Bus.new()
	end
	def show
		@bus = Bus.find(params[:id])
	end
	def create
		parametros = params.require(:bus).permit(:patente, :tipo, :asientos)	
		@bus = Bus.new(parametros)
	  	respond_to do |format|
	  		if @bus.save
	  			format.html { redirect_to buses_path, notice: 'La combi se agregó correctamente.' }
	  		else
	  			format.html { render :index }
	  		end
	  	end
  	end
  	def edit
  		@bus = Bus.find(params[:id])
	end

    def update
    	@bus = Bus.find(params[:id])
    	parametros = params.require(:bus).permit(:patente, :tipo, :asientos)
	  	respond_to do |format|
	  		if @bus.update(parametros)
	  			format.html { redirect_to buses_path, notice: 'La combi se actualizó correctamente.' }
	  		else
	  			format.html { render :edit }
	  		end
	  	end
	  	end
	 end
	
	def destroy
		bus = Bus.find(params[:id])
		bus.destroy
		redirect_to buses_path
	end

  	end