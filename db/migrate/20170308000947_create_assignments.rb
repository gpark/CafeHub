class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :start_time
      t.integer :end_time
      t.text :comments

      t.timestamps null: false
    end
    add_reference :assignments, :user, index: true, foreign_key: true
    add_reference :assignments, :facility, index: true, foreign_key: true
    add_reference :assignments, :assignments_week, index: true, foreign_key: true
  end
end
