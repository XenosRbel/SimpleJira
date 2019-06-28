FactoryBot.define do
	factory :project do
		name {"MyString"}
		summary {"MyString"}
		start_date {"2019-06-19"}
		end_date {"2019-08-19"}
		team {FactoryBot.create(:team)}
	end
end
