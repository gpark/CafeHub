# == Schema Information
#
# Table name: preferences
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  minimum_hours :integer
#  maximum_hours :integer
#  daily_hours   :integer
#  spread_out    :boolean
#  time_of_week  :string
#  time_of_day   :string
#  user_id       :integer
#  obl1_expl     :text
#  obl2_expl     :text
#  obl3_expl     :text
#  obl4_expl     :text
#

class Preference < ActiveRecord::Base
  belongs_to :user
  has_many :preference_entries, dependent: :destroy

  def entries_array
    # 0: prefer, 1: available, 2: r/n, 3: unavailable
    entries_arr = Array.new(336, 1)  #populate with available
    self.preference_entries.each do |entry|
      entry_type = 3
      if entry.name == "Prefer"
        entry_type = 0
      elsif entry.name == "R/N"
        entry_type = 2
      end
      (entry.start_time...entry.end_time).each do |time|
        entries_arr[time] = entry_type
      end
    end
    (0...336).each do |time|
      if entries_arr[time] == 1 && !self.preferred_time?(time)
        entries_arr[time] = 2
      end
    end
    return entries_arr
  end

  def preferred_time?(time)
    #   Weekend < 48 or >287
    #   time % 48 will give you half hour of day
    #     14 < morning < 24 < mid-day < 34 < evening < 14
    result = true
    if self.time_of_week.include?("weekday") && (time < 48 || time > 287)
      result = false
    elsif self.time_of_week.include?("weekend") && !(time < 48 || time > 287)
      result = false
    end
    adj_time = time % 48
    if self.time_of_day.include?("morning") && !(adj_time >= 14 && adj_time < 24)
      result = false
    elsif self.time_of_day.include?("mid-day") && !(adj_time >= 24 && adj_time < 34)
      result = false
    elsif self.time_of_day.include?("evening") && !(adj_time >= 34 && adj_time < 16)
      result = false
    end
    return result
  end

end
