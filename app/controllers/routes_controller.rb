class RoutesController < ApplicationController
	def index
		@routes = Route.all
	end
	def show
		@routes = Route.find(params[:id])
	end
	def new
		@route = Route.new
	end
	def edit
		@route = Route.new
	end
	def create
		@route = Route.new(city_params)

		respond_to do |format|
			if @route.save
				format.html { redirect_to routes_path , notice: 'Ciudad creada.' }
			else
				format.html { render :new }
			end
		end
	end


private
	  # Only allow a list of trusted parameters through.
    def city_params
    	params.require(:city).permit(:nombre)
    end
end
