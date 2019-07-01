FactoryBot.define do
	factory :user do
		admin {0}
		email {Faker::Internet.email}
		first_name {Faker::Name.first_name}
		last_name {Faker::Name.last_name}
		password {'qweqweqwe'}
		team {FactoryBot.create(:team)}
  end
end
