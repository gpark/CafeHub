class AddTimesToPreferenceEntries < ActiveRecord::Migration
  def change
    add_column :preference_entries, :start_time, :integer
    add_column :preference_entries, :end_time, :integer
  end
end
