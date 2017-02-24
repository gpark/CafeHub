class AddUserIdToPreferenceEntries < ActiveRecord::Migration
  def change
    add_column :preference_entries, :preference_id, :integer
  end
end
