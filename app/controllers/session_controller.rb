class SessionController < ApplicationController
  def index
    @user = User.new
  end
  
  def new
  end

  def create
    user = User.find_by(email: params[:email]) 
    if user.present? && user.authenticate(params[:password]) # Todo
      session[:user_id] = user.id
      redirect_to tasks_path, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid email or password. Please try again."
      render :new, alert: "Invalid email or password."  
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully!"
  end

end