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

require 'test_helper'

class SubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
