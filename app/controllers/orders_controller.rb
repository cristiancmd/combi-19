class OrdersController < ApplicationController
 before_action :authenticate_user! , except: [:show, :index]
 


  def index
  end

  def show
  	@viaje = params[:viaje]
  end

  def new
  	@order = Order.new
  	@viaje = Trip.find_by id:(params[:viaje])
  	
  	if current_user.date_of_birth.nil? or current_user.name.blank?
  		redirect_to edit_user_registration_path, alert: 'Debe completar su perfil para realizar compras'
  	end	
  end
end
