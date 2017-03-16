# == Schema Information
#
# Table name: assignments
#
#  id                  :integer          not null, primary key
#  start_time          :integer
#  end_time            :integer
#  comments            :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#  facility_id         :integer
#  assignments_week_id :integer
#

class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :facility
  belongs_to :assignments_week
  has_one :sub  
end
