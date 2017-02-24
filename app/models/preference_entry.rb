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
