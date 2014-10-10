class RegistrationsController < Devise::RegistrationsController
	skip_before_filter :require_no_authentication 

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

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :avatar_url, :password, :password_confirmation, :email, roles: [])
	end
	
end