class PlanillasController < ApplicationController

	before_action :set_bus, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_chofer! , except: [:show, :index]


	def index
		@planilla = Planilla.all
		
	end	
	def new
		@planilla = Planilla.new
		@user = User.find((params[:format]))
		@viaje = params[:viaje]
	end

	def show
		@planilla = Planilla.find(params[:id])
	end
	def edit
	end	

	def aceptar
		
	end

	def create
			session[:return_to] ||= request.referer
			@planilla = Planilla.new(planilla_params)
			@planilla.aceptado = true
			if @planilla.temp != nil 
			if @planilla.temp >= 37.5
				if @planilla.ext14 or @planilla.cont14 or @planilla.sintomas or @planilla.fiebre or @planilla.garganta or @planilla.hipt or @planilla.eResp or @planilla.diabetes or @planilla.inmDep or @planilla.corazon or @planilla.corazon or @planilla.embarazada or @planilla.cFiebre or @planilla.hijos
					@planilla.aceptado = false
				end
			else
				suma = (params[:planilla][:ext14]).to_i + (params[:planilla][:cont14]).to_i + (params[:planilla][:fiebre]).to_i + (params[:planilla][:garganta]).to_i
				if suma == 1
					if @planilla.sintomas or @planilla.hipt or @planilla.eResp or @planilla.diabetes or @planilla.inmDep or @planilla.corazon or @planilla.embarazada or @planilla.cFiebre or @planilla.hijos
						@planilla.aceptado = false
					end
				else
					
					if suma > 1
						@planilla.aceptado = false
					end
				end
			end
			end

			respond_to do |format|
				
				if @planilla.save
					if @planilla.aceptado == false
						@user = User.find((params[:planilla][:user_id]))
						
						@user.update(covid_at: Time.now)
					end
					format.html { redirect_to trip_path(params[:viaje_id]), notice: 'La planilla se agregó correctamente.' }
				else
					format.html { redirect_to session.delete(:return_to), alert: 'Debe completar todos los campos!'  }
				end
			end

	end	
	

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus
    	@planilla = Planilla.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def planilla_params
    	params.require(:planilla).permit(:temp, :ext14, :cont14, :sintomas, :fiebre, :garganta, :hipt, :eResp, :diabetes, :inmDep, :corazon, :hijos, :embarazada, :cFiebre,:user_id)
    	
    end

end
