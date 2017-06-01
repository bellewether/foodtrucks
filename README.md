# San Francisco Food Trucks
This is a command line program that displays all of the food trucks in San Francisco that are open right now (when the program is run) as well as their locations. It is written in Ruby.

## What to install to run this program
- You will need the ruby gem 'soda-ruby'
  To install:
  `gem install soda-ruby`

  Note:
  In order to use this gem, you need Ruby 2.0.0 or above. Check which version you are running by typing ruby -v

- You do not need an app token to use this program, but if you plan to make heavy use of it, you should grab one here: https://dev.socrata.com/docs/app-tokens.html

  Follow these steps IF you need to use an app token:
    1. Install the ruby gem 'dot-env'
      `gem install dotenv`

    2. Make your own .env file and save your token as
      `APP_TOKEN=REPLACEWITHYOURSECRETTOKEN`

    3. Use your app token to identify your application.
       Replace `SODA::Client.new({:domain => "data.sfgov.org"})`
       with
       `SODA::Client.new({:domain => "data.sfgov.org", :app_token => APP_TOKEN})`

- Once you've cloned this repository, navigate into the `foodtrucks` in your directory.
- Run your program from the command line by typing `ruby show_open_food_trucks.rb`

## What I'd do differently if building a full-scale application
* If I were asked to build a full-scale application, I'd start with OOP design. I'd prefer to abstract the API call away to its own wrapper class and create food truck objects from the results of the API call.
* I'd imagine that a future user might not want to just query what food trucks were open right now, but also make queries based on other factors. Keeping that in mind, I'd construct the API wrapper functions to allow for not just one type of query but many and different combinations.
* Currently, my API call retrieves all trucks open today and there is an additional step to filter the results. For a full-scale application, I would spend more time constructing the query to return only trucks that are open currently.
