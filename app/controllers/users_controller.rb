class UsersController < ApplicationController
	load_and_authorize_resource
	
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:notice] = "Updated"
			redirect_to user_path
		else
			flash[:notice]= "Could not update"
			render users_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :avatar_url, :password, :password_confirmation, :email, roles: [])
	end
end