class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@books = Book.all
		@show_book = Book.find(current_user.id)
		@book = Book.new
	end

	def index
		@book = Book.new
		@users = User.all
	end

	before_action :correct_user, only: [:edit, :update]

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		   flash[:notice] = "You have updated user successfully."
		   redirect_to user_path(@user.id)
		else
		   render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end
	def correct_user
		user = User.find(params[:id])
		if current_user != user
			redirect_to user_path(current_user.id)
		end
	end

end
