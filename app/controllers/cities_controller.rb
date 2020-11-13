class CitiesController < ApplicationController
	before_action :set_city, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:show, :index]
	
	def index
		@city = City.all

	end
	def show
		@city = City.find(params[:id])
	end
	def new
		@city = City.new
	end

	def create
		@city = City.new(city_params)

		respond_to do |format|
			if @city.save
				format.html { redirect_to cities_path , notice: 'Ciudad creada.' }
			else
				format.html { render :new }
			end
		end
	end

	def edit
	end

	def destroy
		city = City.find(params[:id])
		if Route.where(initial_city: city).or(Route.where(destination_city: city)).exists?
			redirect_to cities_path , alert: 'La ciudad tiene rutas asignadas'
		else
			city.destroy
			redirect_to cities_path
		end
		
	end



  def update
  	respond_to do |format|
  		if @city.update(city_params)
  			format.html { redirect_to cities_path, notice: 'La ciudad se actualizo correctamente.' }
  		else
  			format.html { render :edit }
  		end
  	end
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
    	@city = City.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def city_params
    	params.require(:city).permit(:nombre)
    end

end
