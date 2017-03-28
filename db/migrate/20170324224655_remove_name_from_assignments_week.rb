class RemoveNameFromAssignmentsWeek < ActiveRecord::Migration
  def change
    remove_column :assignments_weeks, :name, :string
  end
end
