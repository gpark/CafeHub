json.week AssignmentsWeek.find(@chosen_week).to_s

json.subs @subs do |sub|

    json.start_time sub.assignment.start_time.to_timestring
    json.end_time sub.assignment.end_time.to_timestring
    json.name sub.assignment.user.name
    json.comments sub.comments

end