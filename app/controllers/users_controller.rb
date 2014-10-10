class UsersController < ApplicationController
	load_and_authorize_resource
# MAKE SURE ABOUT THE NEW USER. DO WE INCLUDE A CURRENT USER ADMIN CHECK?
	
	def index
		@users = User.all
		 # if you want to enable search on users index, 
		 # uncomment the line below and the form on views/users/index.html.erb
	 #@users = User.text_search(params[:query])#.page(params[:page])
	end

	def new
  	@user = User.new
	end

	def create
  	@user = User.new(user_params)
  	if @user.save
    	flash[:notice] = "Successfully created User." 
    	redirect_to root_path
  	else
    	render :action => 'new'
  	end
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