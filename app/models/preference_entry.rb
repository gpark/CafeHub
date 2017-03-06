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

class PreferenceEntry < ActiveRecord::Base
  belongs_to :preference

  def color
    color_mapper = {  "Prefer" => "#ABAD23",
                      "Class" => "#E04E39",
                      "R/N" => "#B7B09C",
                      "Obligation1" => "#71CC98",
                      "Obligation2" => "#4bbe7d",
                      "Obligation3" => "#399d64",
                      "Obligation4" => "#96d9b3",
                    }
    return color_mapper[self.name]
  end
end
