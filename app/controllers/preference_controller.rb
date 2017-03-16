class PreferenceController < ApplicationController
  authorize_resource
  
  def edit

  end

  def view
    if current_user.preference == nil
      pref = Preference.create( minimum_hours: 8, maximum_hours: 20,
                                      daily_hours: 2, spread_out: false,
                                      time_of_week: 'Prefer weekdays',
                                      time_of_day: 'Prefer mornings')
      current_user.preference = pref
      current_user.save
    end
    @preference = current_user.preference
    @entries = @preference.preference_entries
  end

  def change
    @preference = current_user.preference
    @preference.entries.destroy_all
    preference_hash = params[:preference]
    entries = preference_hash[:entries]
    preference_hash.delete("entries")
    @preference.assign_attributes(preference_hash)
    entries.each do |entry|
      entr = @preference.preference_entries.new
      entr.name = entry.name
      entr.start_time = entry.start_time.to_hr_form
      entr.end_time = entry.end_time.to_hr_form
      if !entr.save
        redirect_to '/preference/edit', alert: "Error submitting preference."
      end
    end
    if @preference.save
      redirect_to '/preference/edit', notice: "Preference submitted successfully."
    else
      redirect_to '/preference/edit', alert: "Error submitting preference."
    end

  end

end
