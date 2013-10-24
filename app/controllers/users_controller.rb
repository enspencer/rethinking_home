class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
		@json = @user.stories.each do |story|
			story.to_gmaps4rails do |story, marker|
			marker.infowindow render_to_string(:partial => "/stories/infowindow", :locals => { :story => story})
		end
	end
end


	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :username)
	end
end