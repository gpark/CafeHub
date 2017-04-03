# == Schema Information
#
# Table name: assignments_weeks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  start_date :date
#  end_date   :date
#

class AssignmentsWeek < ActiveRecord::Base
  has_many :assignments

  def to_s
      return self.start_date.to_s + " to " + self.end_date.to_s
  end

  def generate_preferences

  end

  def generate_assignments
    # general idea:
    #   fill shifts with least amount of people available
    #   then assign employees with least amount of time available

    # preferences data structure represented in a hash containing lists like this:
    #   time(int): [preference_type(int 0: prefer, 1: available, 2: r/n), user_id(int)]

    # preference attributes:
    #   minimum_hours
    #   maximum_hours
    #   if spread_out, try not to assign more than 2? hours at a time
    #   try not to exceed daily_hours
    #   time_of_week
    #   time_of_day

  end


end
