json.preference do
  
  json.minimum_hours @preference.minimum_hours
  json.maximum_hours @preference.maximum_hours
  json.daily_hours @preference.daily_hours
  json.spread_out @preference.spread_out
  json.time_of_week @preference.time_of_week
  json.time_of_day  @preference.time_of_day
  json.obl1_expl @preference.obl1_expl
  json.obl2_expl @preference.obl2_expl
  json.obl3_expl @preference.obl3_expl
  json.obl4_expl @preference.obl4_expl

  json.entries @entries do |entry|
    json.name entry.name
    json.start_time entry.start_time.to_timestring
    json.end_time entry.end_time.to_timestring
  end

end
