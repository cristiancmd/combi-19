class SearchesController < ApplicationController
	
	
	def index
		@search = Search.buscar(params[:origen_id], params[:destino_id],params[:fecha])
	end	

	def new

		@origenes = City.all
		@destinos = City.all
		@search = Search.new
	end
	def create
		
	end


	def show
		
	end



	private

	def search_params
		params.require(:search).permit(:origen_id, :destino_id)
		
	end














end
