class OrdersController < ApplicationController
 before_action :authenticate_user! , except: [:show, :index]
 before_action :set_order, only: [:show, :edit, :update, :destroy]


  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
  	
    @order = Order.find(params[:id])
  end

  def new
  	
    @order = Order.new 

    @viaje = Trip.find_by id:(params[:viaje])
    
    
  	if current_user.date_of_birth.nil? or current_user.name.blank?
  		redirect_to edit_user_registration_path, alert: 'Debe completar su perfil para realizar compras'
  	end	
    

  end

  def create

    session[:return_to] ||= request.referer #guardo la url para redireccionar
    @order = Order.new(order_params)

    
      if @order.save
         redirect_to orders_path, notice: 'Su orden se genero exitosamente'
      else
         redirect_to session.delete(:return_to) , alert: 'Su tarjeta de credito no es invalida'
         
        
      end
  
  end

  def order_params
      params.require(:order).permit(:tarjeta,:cobro, :user_id, :trip_id)
    end

  def set_order
      @order = Order.find(params[:id])
    end  
end
