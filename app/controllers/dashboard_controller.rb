class DashboardController < ApplicationController
  def index
    @tasks = Current.user.tasks
    @total_tasks = Current.user.tasks.count

    @completed_tasks = Current.user.tasks.where(status: 3).count #finding the count of completed tasks
    @completion_percentage = @total_tasks > 0 ? (@completed_tasks.to_f / @total_tasks * 100).round(2) : 0  #calculating the percentage

    @tasks_by_status = Current.user.tasks.group(:status).count
    @tasks_by_priority = Current.user.tasks.group(:priority).count

    # assigned tasks section

    @total_assigned_tasks = Task.where(assignee_id: Current.user.id).count

    @completed_assigned_tasks = Task.where(assignee_id: Current.user.id).where(status: 3).count #finding the count of completed tasks
    @completion_assigned_percentage = @total_assigned_tasks > 0 ? (@completed_assigned_tasks.to_f / @total_assigned_tasks * 100).round(2) : 0  #calculating the percentage

    @assigned_tasks_by_status = Task.where(assignee_id: Current.user.id).group(:status).count
    @assigned_tasks_by_priority = Task.where(assignee_id: Current.user.id).group(:priority).count
  end

end