# == Schema Information
#
# Table name: subs
#
#  id                  :integer          not null, primary key
#  comments            :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  assignments_week_id :integer
#  assignment_id       :integer
#

class Sub < ActiveRecord::Base
end
