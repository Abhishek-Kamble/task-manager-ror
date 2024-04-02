class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :due_date
      t.integer :status
      t.integer :priority
      t.references :assignee, foreign_key: {to_table: :users}
      t.references :user, foreign_key: true
      t.references :verifier, foreign_key: {to_table: :users}
      t.references :creator, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
