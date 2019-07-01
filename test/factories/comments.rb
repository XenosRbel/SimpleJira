FactoryBot.define do
	factory :comment do
		content {"MyText"}
		post {FactoryBot.create(:post)}
		user {FactoryBot.create(:user)}
	end
end
