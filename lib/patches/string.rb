class String

    def to_hr_form
        matches = /(.*) (.*):(.*) (.*)M/.match(self) #<MatchData "M 3:30 AM" 1:"M" 2:"3" 3:"30" 4:"A">
        if matches == nil
            raise 'This method is not applicable for the string: ' + self
        end
        day = ["Su", "M", "Tu", "W", "Th", "F", "Sa"].index(matches[1])
        hr = matches[2]
        min = matches[3]
        ampm = matches[4]
        if hr == "12"
            hr = "0"
        end
        total = (day * 48) + hr.to_i * 2
        if min == "30"
            total += 1
        end
        if ampm == "P"
            total += 24
        end
        return total
    end

    def self.all_times(start="12:00 AM", end_time="12:00 AM", end_before_midnight=false)
      current_time = ("2016-1-1 " + start).to_time
      if end_before_midnight
        end_time = ("2016-1-1 " + end_time).to_time
      else
        end_time = ("2016-1-2 " + end_time).to_time
      end
      times = []
      while current_time < end_time do
        times.push(current_time.strftime("%I:%M %p"))
        current_time = current_time + 30*60
      end
      return times
    end

end
