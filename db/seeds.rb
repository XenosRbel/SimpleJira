# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

300.times do
  Project.create(
             name: Faker::TvShows::SiliconValley.invention,
             summary: Faker::TvShows::SiliconValley.motto,
             start_date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
             end_date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
             team_id: Faker::Number.between(1, 100)
  )
end

300.times do
  Post.create(
      content: Faker::TvShows::Simpsons.quote,
      project_id: Faker::Number.between(1, 300)
  )
end

300.times do
  User.create(
      email: Faker::Internet.email,
      admin: 0,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name ,
      password: "qweqweqwe",
      team_id: Faker::Number.between(1, 10)
      )
end

10.times do
  Team.create(
      name: Faker::TvShows::SiliconValley.company
      )
end

300.times do
  Task.create(
          title: Faker::TvShows::SiliconValley.app,
          content: Faker::TvShows::SiliconValley.quote,
          status: 1,
          start_date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
          due_date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
          estimation: 10,
          user_id: Faker::Number.between(1, 100 )
  )
end