# app/helpers/task_helper.rb

module TaskHelper
  def task_status_background(status)
    case status
    when 1
      "background-color: #ffeeba;" # Faint yellow for pending tasks
    when 2
      "background-color: #cce5ff;" # Faint blue for in progress tasks
    when 3
      "background-color: #d4edda;" # Faint green for completed tasks
    else
      "" # Default background color if status doesn't match
    end
  end

  def priority_string(priority)
    case priority
    when 1
      "Low"
    when 2
      "Medium"
    when 3
      "High"
    else
      "Unknown"
    end
  end

  def status_string(status)
    case status
    when 1
      "Pending"
    when 2
      "In Progress"
    when 3
      "Completed"
    else
      "Unknown"
    end
  end
  
end
