class UsersController < ApplicationController
  def users_by_department
    department_id = params[:department_id]
    # Retrieve users based on the department_id
    @users = User.where(department_id: department_id).order(:first_name, :last_name)

    respond_to do |format|
      format.json { render json: @users.map { |user| { id: user.id, full_name: "#{user.first_name} #{user.last_name}", email: user.email } } }
    end
  end
end
