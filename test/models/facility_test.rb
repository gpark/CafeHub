# == Schema Information
#
# Table name: facilities
#
#  id         :integer          not null, primary key
#  name       :string
#  spots      :integer
#  su_start   :string
#  su_end     :string
#  m_start    :string
#  m_end      :string
#  tu_start   :string
#  tu_end     :string
#  w_start    :string
#  w_end      :string
#  th_start   :string
#  th_end     :string
#  f_start    :string
#  f_end      :string
#  sa_start   :string
#  sa_end     :string
#  comments   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FacilityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
