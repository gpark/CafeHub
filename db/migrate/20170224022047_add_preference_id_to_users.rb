class AddPreferenceIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :preference_id, :integer
  end
end
