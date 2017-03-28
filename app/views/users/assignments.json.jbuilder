json.assignments @assignments do |assignment|
  json.start_time assignment.start_time.to_timestring
  json.end_time assignment.end_time.to_timestring
  json.facility assignment.facility.name
end
