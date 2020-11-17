class ChofersController < ApplicationController
		before_action :authenticate_user! #, except: [:show, :index]

	def index
		if not Chofer.any?
			redirect_to  new_chofer_path, notice: 'Todavía no existe ningun chofer'
		else
			@chofers = Chofer.all()
		end
	end
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
	  		if Chofer.where(nombre: chofer_params["nombre"], apellido: chofer_params["apellido"]).exists?
				redirect_to edit_chofer_path , alert: 'El chofer ya existe'
	  		elsif @chofer.update(chofer_params)
	  			redirect_to chofers_path, notice: 'El chofer se actualizo correctamente.'
	  		else
	  			render :edit 
	  		end
	 end
	
	def destroy
		chofer = Chofer.find(params[:id])
		chofer.destroy
		redirect_to chofers_path
	end
private
	def chofer_params
		params.require(:chofer).permit(:nombre, :apellido, :dni, :inicio_actividad)
	end
end