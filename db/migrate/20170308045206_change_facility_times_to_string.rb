class ChangeFacilityTimesToString < ActiveRecord::Migration
  def change
    change_column :facilities, :su_start, :string
    change_column :facilities, :su_end, :string
    change_column :facilities, :m_start, :string
    change_column :facilities, :m_end, :string
    change_column :facilities, :tu_start, :string
    change_column :facilities, :tu_end, :string
    change_column :facilities, :w_start, :string
    change_column :facilities, :w_end, :string
    change_column :facilities, :th_start, :string
    change_column :facilities, :th_end, :string
    change_column :facilities, :f_start, :string
    change_column :facilities, :f_end, :string
    change_column :facilities, :sa_start, :string
    change_column :facilities, :sa_end, :string
  end
end
