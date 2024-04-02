class User < ApplicationRecord

  has_many :tasks
  has_many :created_tasks, foreign_key: 'creator', class_name: 'Task'
  # has_many :assignees, through: :tasks, source: :creator

  belongs_to :department, class_name: 'Department'

  has_secure_password

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
