require 'rails_helper'

RSpec.describe Post, type: :model do
	it 'should valid with valid attributes' do
		subject = FactoryBot.create(:post)
		
		expect(subject).to be_valid
	end
	
	it 'should valid without valid attributes' do
		subject = FactoryBot.create(:post)
		subject.content = ''
		
		expect(subject).to_not be_valid
	end
end
