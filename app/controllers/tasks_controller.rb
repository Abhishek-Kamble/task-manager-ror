class TasksController < ApplicationController
  before_action :require_login
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  helper TaskHelper

  def index
    @tasks = Current.user.tasks

    sort_by = params[:sort]

    case sort_by
    when 'priority'
      @tasks = @tasks.order(priority: :desc)
    when 'due_date'
      @tasks = @tasks.order(due_date: :asc) 
    when 'status'
      @tasks = @tasks.order(status: :asc) 
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Current.user.tasks.build
    @departments = Department.all.pluck(:name, :id)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Current.user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @task = Current.user.tasks.build(task_params)
    @task.creator = Current.user    
    if @task.save
      redirect_to @task, notice: 'task was successfully created.'
    else
      @departments = Department.all.pluck(:name, :id)
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully destroyed.'
  end

  def non_verified_tasks
    @non_verified_tasks = Task.where(verifier_id: nil).where.not(user_id: Current.user.id).where.not(assignee_id: Current.user.id)
  end

  def show_for_approval
    @task = Task.find(params[:id])
  end

  def approve
    @task = Task.find(params[:id])
    if @task.update(verifier_id: Current.user.id)
      redirect_to @task, notice: 'Task was successfully approved.'
    else
      redirect_to @task, alert: 'Failed to approve task.'
    end
  end

  def assigned_tasks
    @assigned_tasks = Task.where(assignee_id: Current.user.id)

    sort_by = params[:sort]

    case sort_by
    when 'priority'
      @assigned_tasks = @assigned_tasks.order(priority: :desc)
    when 'due_date'
      @assigned_tasks = @assigned_tasks.order(due_date: :asc) 
    when 'status'
      @assigned_tasks = @assigned_tasks.order(status: :asc) 
    end
  end

  def show_assigned_task
    @task = Task.find(params[:id])
  end

  def mark_complete
    @task = Task.find(params[:id])
    if @task.update(status: 3)
      redirect_to @task, notice: 'Task marked as completed.'
    else
      redirect_to @task, alert: 'Failed to mark the task as completed.'
    end
  end

  def acknowledge_task
    @task = Task.find(params[:id])
    if @task.update(status: 2)
      redirect_to @task, notice: 'Task marked as completed.'
    else
      redirect_to @task, alert: 'Failed to acknowledge the task.'
    end
  end

  private
    def set_task
      @task = Current.user.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :due_date, :status, :priority, :department_id, :assignee_id, :creator_id)
    end

    def require_login
      unless Current.user
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_path
      end
    end
end
