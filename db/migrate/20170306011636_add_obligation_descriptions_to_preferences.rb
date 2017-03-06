class AddObligationDescriptionsToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :obl1_expl, :text
    add_column :preferences, :obl2_expl, :text
    add_column :preferences, :obl3_expl, :text
    add_column :preferences, :obl4_expl, :text
  end
end
