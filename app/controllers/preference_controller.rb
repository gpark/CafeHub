class PreferenceController < ApplicationController
  def edit
    if current_user.preference == nil
      @preference = Preference.create(  minimum_hours: 8, maximum_hours: 20,
                                        daily_hours: 2, spread_out: false,
                                        time_of_week: 'Prefer weekdays',
                                        time_of_day: 'Prefer mornings')
      @preference.preference_entries.new(name: "Class")
      @preference.preference_entries.new(name: "Prefer")
      @preference.preference_entries.new(name: "R/N")
      ["1", "2", "3", "4"].each do |n|
        @preference.preference_entries.new(name: "Obligation"+n, comments: "Please explain your obligation")
      end
      current_user.preference = @preference
      current_user.save
    end
    @preference = current_user.preference
  end
end
