class RemoveCommentsFromAssignments < ActiveRecord::Migration
  def change
    remove_column :assignments, :comments, :text
  end
end
