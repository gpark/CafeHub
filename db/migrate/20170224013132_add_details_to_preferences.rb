class AddDetailsToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :minimum_hours, :integer
    add_column :preferences, :maximum_hours, :integer
    add_column :preferences, :daily_hours, :integer
    add_column :preferences, :spread_out, :boolean
    add_column :preferences, :time_of_week, :string
    add_column :preferences, :time_of_day, :string
  end
end
