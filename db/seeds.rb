# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
    email: 'admin@admin.admin',
    admin: 1,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "admin1111"
)

team = Team.create(
    name: 'Test Lazy Team'
)

User.create(
    email: 'lazy_user@admin.admin',
    admin: 0,
    first_name: 'Faker::Name.first_name',
    last_name: 'Faker::Name.ast_name',
    password: "admin1111",
    team_id: team.id
)

Project.create(
    name: 'Test Lazy Project',
    summary: Faker::TvShows::SiliconValley.motto,
    start_date: '02-07-2019',
    end_date: '02-08-2019',
    team_id: team.id
)

10.times do
  Team.create(
      name: Faker::TvShows::SiliconValley.company
  )
end

300.times do
  Project.create(
      name: Faker::TvShows::SiliconValley.invention,
      summary: Faker::TvShows::SiliconValley.motto,
      start_date: '02-07-2019',
      end_date: '02-08-2019',
      team_id: Faker::Number.between(2, 100)
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
      team_id: Faker::Number.between(2, 10)
      )
end

300.times do
  Task.create(
      title: Faker::TvShows::SiliconValley.app,
      content: Faker::TvShows::SiliconValley.character,
      comments: Faker::TvShows::SiliconValley.quote,
      status: Faker::Number.between(1, 5),
      start_date: '02-07-2019',
      due_date: '02-08-2019',
      estimation: Faker::Number.between(1, 4),
      user_id: Faker::Number.between(1, 100),
      project_id: Faker::Number.between(1, 10)
  )
end