class Task < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: "creator_id"
  belongs_to :assignee, class_name: 'User', optional: true
  belongs_to :verifier, class_name: 'User', optional: true
  belongs_to :department, class_name: 'Department'

  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  validates :department_id, presence: true

end
