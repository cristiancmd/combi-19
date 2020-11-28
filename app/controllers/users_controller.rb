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
end
