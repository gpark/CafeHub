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

require 'test_helper'

class PreferenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
