class UsersController < ApplicationController
  def index
  	if User.any?
	 		@users = User.all
	 	else
	 		redirect_to  main_home_path, alert: 'No existen usuarios' 
	 	end

  end
  def show
		@user = User.find(params[:format])
	end


	def suscripcion
		@user = User.find(current_user.id)
		if @user.suscripcion == false
			if @user.update(suscripcion: true)
				UserMailer.test_send(@user).deliver
				redirect_to users_show_path(@user.id), notice: 'Suscripcion exitosa!'
			end	
		else
			redirect_to users_show_path(@user.id), notice: 'Ya estabas suscripto!'	
		end	
	end

end
