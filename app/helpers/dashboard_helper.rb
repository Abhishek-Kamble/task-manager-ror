module DashboardHelper
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