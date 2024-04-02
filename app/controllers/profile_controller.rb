class ProfileController < ApplicationController
  def index
    @user = Current.user
    @departments = Department.all.pluck(:name, :id)
  end
end