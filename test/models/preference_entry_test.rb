# == Schema Information
#
# Table name: preference_entries
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  preference_id :integer
#  start_time    :integer
#  end_time      :integer
#

require 'test_helper'

class PreferenceEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
