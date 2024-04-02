class RegistrationsController < ApplicationController
  def new
    @user = User.new
    @departments = Department.all.pluck(:name, :id)
  end

  def create
    @user = User.new(user_params)  #user_params is a helper method
    if @user.save
      session[:user_id] = @user.id      #cookies
      redirect_to tasks_path, notice: "Successfully signed up!"
    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end

  private

  def user_params
    #params refers to total hash recieved
    params.require(:user).permit(:first_name, :last_name, :date_of_birth, :department_id, :country, :email, :password, :password_confirmation)

    # .require = generates error if provide key is not found in hash
    # .permit = only provided parameters are allowed to set
  end

end