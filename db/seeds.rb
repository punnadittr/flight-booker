# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airport::destroy_all
Flight::destroy_all

airport_names = ["KIX","BKK","OKA","CTS","NRT","DMK","JFK","UKB"]

airport_names.each do |name|
  Airport.create!(name: name)
end

1000.times do
  Flight.create!(to_airport_id: Airport.ids.sample, 
    from_airport_id: Airport.ids.sample, 
    travel_date: Faker::Date.between(Time.now, 10.days.from_now).to_date, 
    duration: Faker::Number.between(10800, 36000),
    time: Faker::Time.between(1.day.ago, Time.now))
end