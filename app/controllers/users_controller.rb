class UsersController < ApplicationController
#before_action :authenticate_user!
	#load_and_authorize_resource

	def index
		
		@users = User.all
	end

	# def destroy
	# 	@user = User.find(params[:id])
	# 	@user.destroy
	# 	UserMailer.inactive_mail(@user).deliver
	# 	redirect_to users_path
	# end

	def get_user

		redirect_to new_user_registration_path 
	end

	def block_user
		@user = User.find(params[:id])

		@user.update_attributes(:status => params[:status])
		
		UserMailer.inactive_mail(@user).deliver
		render nothing: true
	end

end
