class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	# debugger
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      flash[:success] = "Welcome to the Hello App!"
      # 레일스에서 알아서 redirect_to @user도 인정해줍니다. 실제로 user_url(@user)로 하는 의도라면요.
      redirect_to @user
  	else
  		render 'new'
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end
