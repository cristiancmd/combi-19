class ChofersController < ApplicationController
		before_action :authenticate_user! #, except: [:show, :index]

	def index
		@chofers = Chofer.all()
	def new
		@chofer = Chofer.new()
	end
	def show
		@chofer = Chofer.find(params[:id])
	end
	def create
		parametros = params.require(:chofer).permit(:nombre, :apellido, :dni, :inicio_actividad)	
		@chofer = Chofer.new(parametros)
	  	respond_to do |format|
	  		if @chofer.save
	  			format.html { redirect_to chofers_path, notice: 'El chofer se actualizo correctamente.' }
	  		else
	  			format.html { render :index }
	  		end
	  	end
  	end
  	def edit
  		@chofer = Chofer.find(params[:id])
	end

    def update
    	@chofer = Chofer.find(params[:id])
    	parametros = params.require(:chofer).permit(:nombre, :apellido, :dni, :inicio_actividad)
	  	respond_to do |format|
	  		if @chofer.update(parametros)
	  			format.html { redirect_to chofers_path, notice: 'El chofer se actualizo correctamente.' }
	  		else
	  			format.html { render :edit }
	  		end
	  	end
	  	end
	 end
	
	def destroy
		chofer = Chofer.find(params[:id])
		chofer.destroy
		redirect_to chofers_path
	end

  	end
