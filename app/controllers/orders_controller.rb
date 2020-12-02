class OrdersController < ApplicationController
 before_action :authenticate_user! #, except: [:show, :index]
 before_action :set_order, only: [:show, :edit, :update, :destroy]


  def index
    #todos los viajes comprados del usuario
    @orders = Order.order(id: :desc)
    @orders =@orders.where(user_id: current_user.id)
    orderdesc ||= []
    @orders.each do |order|
      if(order.trip.horario.future?)
        orderdesc << order
       end
    end
    @orders = orderdesc
    
  end

  def show
    @order = Order.find(params[:id])
  end

  def past_trips
    @orders = Order.where(user_id: current_user.id).order(id: :desc)
    orderdesc ||= []
    @orders.each do |order|
      if(order.trip.horario.past?)
        orderdesc << order
       end
    end
    @orders = orderdesc

  end

  def cancel_order
    @order = Order.find(params[:order_id])
    order = @order
    cobro = @order.cobro
    half_cobro = (cobro/2)

    if @order.canceled == false && @order.update_attribute(:canceled, true)
       if order.trip.horario.after?(DateTime.current + 2)
          @order.update_attribute(:refunded, cobro)
          redirect_to order_path(@order) , notice: 'Devolvimos tu dinero!'
       else   
          @order.update_attribute(:refunded, half_cobro)
          redirect_to order_path(@order) , notice: 'Devolvimos la mitad de tu dinero!'
       end
    else
        redirect_to order_path(@order) , alert: 'Hubo un problema al cancelar el pasaje'   
    end
  end

  
  def update
        @order = Order.find(params[:id])
        if @order.update(order_params)
          redirect_to order_path(@order) , notice: 'Actualizado'
        else
          redirect_to order_path(@order) , alert: 'No actualizado'   
    end
  end


  def new
  	@viaje = Trip.find_by id:(params[:viaje])
    @order = Order.new
    
    if params[:extra].present?
      @extra = Additional.find_by id:(params[:extra]) 
      stock = @extra.stock - 1
      @extra.update(stock: stock)
      @total = @extra.precio + @viaje.rate

    else
      @total = @viaje.rate
    end
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
         redirect_to session.delete(:return_to) , alert: 'Su tarjeta de credito no es valida. Seleccione otra tarjeta.'
      end
  
  end

  def order_params
      params.require(:order).permit(:tarjeta,:cobro, :user_id, :trip_id, :canceled, :refunded, :additional_id)
    end

  def set_order
      @order = Order.find(params[:id])
    end  
end
