class AddTimesToAssignmentsWeeks < ActiveRecord::Migration
  def change
    add_column :assignments_weeks, :start_date, :date
    add_column :assignments_weeks, :end_date, :date
  end
end
