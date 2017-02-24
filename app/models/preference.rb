class Preference < ActiveRecord::Base
  belongs_to :user
  has_many :preference_entries, dependent: :destroy

end
