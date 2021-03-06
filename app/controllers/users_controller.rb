class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:author_id] = @user.id
      flash[:success] = "Welcome to Expense Tracker #{@user.name}"
      redirect_to root_path
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
