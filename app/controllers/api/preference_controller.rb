class Api::PreferenceController < ApplicationController
  authorize_resource

  def view
    if current_user.preference.nil?
      pref = Preference.create(minimum_hours: 8, maximum_hours: 20,
                               daily_hours: 2, spread_out: false,
                               time_of_week: 'Prefer weekdays',
                               time_of_day: 'Prefer mornings')
      current_user.preference = pref
      current_user.save
    end

    @preference = current_user.preference
    @entries = @preference.preference_entries
    render 'api/preference/view'
  end

  def change
    @preference = current_user.preference
    @preference.entries.destroy_all
    preference_hash = params[:preference]
    entries = preference_hash[:entries]
    preference_hash.delete('entries')
    @preference.assign_attributes(preference_hash)

    entries.each do |entry|
      entr = @preference.preference_entries.new
      entr.name = entry.name
      entr.start_time = entry.start_time.to_hr_form
      entr.end_time = entry.end_time.to_hr_form
      unless entr.save
        render json: @preference.errors.full_messages, status: 422
      end
    end

    if @preference.save
      render 'api/preference/view'
    else
      render json: @preference.errors.full_messages, status: 422
    end
  end
end
