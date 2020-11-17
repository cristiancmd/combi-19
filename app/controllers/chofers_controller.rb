class ChofersController < ApplicationController
		before_action :authenticate_user! #, except: [:show, :index]
		before_action :set_chofer, only: [:show, :edit, :update, :destroy]

		def index
			@chofer = Chofer.all
		end
		def new
			@chofer = Chofer.new
		end

		def show
			@chofer = Chofer.find(params[:id])
		end

		def create
			@chofer = Chofer.new(chofer_params)
			respond_to do |format|
				if @chofer.save
					format.html { redirect_to chofers_path, notice: 'El chofer se actualizo correctamente.' }
				else
					format.html { render :new }
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
				if Trip.tiene_chofer(params[:id]).exists?
					respond_to do |format|
						format.html {redirect_to chofers_path, alert: 'El chofer no pudo eliminarse ya que tiene un viaje asociado activo.' }
					end
				else
						chofer.destroy
						redirect_to chofers_path, notice: 'El chofer se eliminó correctamente.' 
				end
		end


		private
			def set_chofer
				@chofer = Chofer.find(params[:id])
			end
			def chofer_params
				params.require(:chofer).permit(:nombre, :apellido, :dni, :inicio_actividad)	
			end	

		end	
