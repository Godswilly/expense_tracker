class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      session[:author_id] = @user.id
      flash[:success] = 'Successfully logged in.'
      redirect_to root_path
    else
      flash.now[:danger] = 'Error logging in.'
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'Logged out!'
  end
end
