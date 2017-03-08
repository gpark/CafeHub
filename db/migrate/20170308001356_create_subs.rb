class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.text :comments

      t.timestamps null: false
    end
    add_reference :subs, :assignments_week, index: true, foreign_key: true
    add_reference :subs, :assignment, index: true, foreign_key: true
  end
end
