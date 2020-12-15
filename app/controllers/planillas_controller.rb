class PlanillasController < ApplicationController

	before_action :set_bus, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_admin! #, except: [:show, :index]


	def index
		@planilla = Planilla.all
		
	end	
	def new
		@planilla = Planilla.new
	end

	def show
		@planilla = Planilla.find(params[:id])
	end
	def edit
	end	

	def create
			@planilla = Planilla.new(planilla_params)
			respond_to do |format|
				if @planilla.save
					format.html { redirect_to trips_path, notice: 'La planilla se agregó correctamente.' }
				else
					format.html { render :new }
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
    	params.require(:planilla).permit(:temp, :ext14, :cont14, :sintomas, :fiebre, :garganta, :hipt, :eResp, :diabetes, :inmDep, :corazon, :hijos, :embarazada, :cFiebre)
    	
    end

end
