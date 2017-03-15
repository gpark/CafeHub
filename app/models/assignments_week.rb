# == Schema Information
#
# Table name: assignments_weeks
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AssignmentsWeek < ActiveRecord::Base
  has_many :assignments

  def to_s
      return self.start_date.to_s + " to " + self.end_date.to_s
  end  
end
