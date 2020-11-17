# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      session[:user_id] = @user.id
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
