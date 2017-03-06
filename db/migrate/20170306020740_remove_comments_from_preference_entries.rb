class RemoveCommentsFromPreferenceEntries < ActiveRecord::Migration
  def change
    remove_column :preference_entries, :comments, :text
  end
end
