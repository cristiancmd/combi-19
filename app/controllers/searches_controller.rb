class SearchesController < ApplicationController
	
	
	def index
	@search = Search.buscar(params[:origen_id], params[:destino_id],params[:fecha])
    search ||= []  # se maneja por un arreglo ya que sqlite no deja hacer consultas con datetime y rails.
    @search.each do |v|
	    if(v.horario.future?)
	    	search << v
	    end
    end
    @search = search

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
		params.require(:search).permit(:origen_id, :destino_id, :fecha)
		
	end














end
