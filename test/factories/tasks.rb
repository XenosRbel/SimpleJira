FactoryBot.define do
	factory :task do
		title {"MyString"}
		content {"MyString"}
		comments {"MyString"}
		status {1}
		start_date {"2019-06-19"}
		due_date {"2019-08-19"}
		estimation {1}
		user {FactoryBot.create(:user)}
		project {FactoryBot.create(:project)}
	end
end
