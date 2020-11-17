class AdditionalsController < ApplicationController
	before_action :set_additional, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user! #, except: [:show, :index]

	def index
		@additional = Additional.all
	end	
	def new
		@additional = Additional.new
	end

	def show
		@additional = Additional.find(params[:id])
	end

	def edit
	end	

	def create
			@additional = Additional.new(additional_params)
			respond_to do |format|
				if @additional.save
					format.html { redirect_to additionals_path, notice: 'El adicional se agregó correctamente.' }
				else
					format.html { render :new }
				end
			end
	end	


	def update
			respond_to do |format|
				if @additional.update(additional_params)
					format.html { redirect_to additionals_path, notice: 'La combi se actualizó correctamente.' }
				else
					format.html { render :edit }
				end
			end
	end	

	def destroy
			additional = Additional.find(params[:id])
			additional.destroy
			redirect_to additionals_path
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_additional
    	@additional = Additional.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def additional_params
    	params.require(:additional).permit(:nombre, :stock, :precio)
    end




end
