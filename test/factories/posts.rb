FactoryBot.define do
	factory :post do
		content {"MyText"}
		project {FactoryBot.create(:project)}
	end
end
