class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Expense Tracker #{@user.username}"
      redirect_to root_path
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  # def show
  #   redirect_to root_path if session[:user_id].nil?
  #   @user = User.find(user_params)
  # end

  # def update
  #   @user = User.find(user_params)
  #   @user.update(user_params)
  #   redirect_to user_path(@user)
  # end

  # def edit
  #   @user = User.find(user_params)
  # end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
