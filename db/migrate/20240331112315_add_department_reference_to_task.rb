class AddDepartmentReferenceToTask < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :department, null: false, foreign_key: true
  end
end
