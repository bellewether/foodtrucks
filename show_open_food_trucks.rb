require 'soda/client'

def time_in_minutes(time)
  time_array = time.split(":")
  hours = time_array[0].to_i
  minutes = time_array[1].to_i

  total_minutes = hours * 60 + minutes
  return total_minutes
end


def get_food_trucks_open_today
  url = "https://data.sfgov.org/resource/bbb8-hzi6"
  day_of_the_week = Time.now.wday

  client = SODA::Client.new({:domain => "data.sfgov.org"})
  results = client.get(url, {:$order => "applicant", :$select => "applicant, location, start24, end24", :dayorder => day_of_the_week})

  return results
end


def filter_trucks_open_right_now(results)
  current_time = Time.now.strftime("%H:%M")
  current_time_in_min = time_in_minutes(current_time)

  results_open_right_now = []
  results.each do |truck|
    if (current_time_in_min >= time_in_minutes(truck["start24"])) && (current_time_in_min <= time_in_minutes(truck["end24"]))
      results_open_right_now.push(truck)
    end
  end

  return results_open_right_now
end


def display(trucks)
  page = 1
  puts "\n"
  printf("%-80s %10s\n", "TRUCK", "ADDRESS")

  trucks.each_with_index do |truck, index|
    if index < page * 10
      printf("%-80s %10s\n", truck["applicant"], truck["location"])
    else
      puts "\nClick 'Y' to see more trucks. If you're done, click any other key to quit.\n"
      input = gets.chomp.strip.downcase

      if input == "y"
        page+=1
      else
        break
      end
    end
  end

end

today_trucks = get_food_trucks_open_today
right_now_trucks = filter_trucks_open_right_now(today_trucks)
display(right_now_trucks)
