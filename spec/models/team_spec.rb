require 'rails_helper'

RSpec.describe Team, type: :model do
  it 'should valid with valid attributes' do
    subject = FactoryBot.create(:team)
    
    expect(subject).to be_valid
  end
  
  it 'should valid without valid attributes' do
    subject = FactoryBot.create(:team)
    subject.name = ''
    
    expect(subject).to_not be_valid
  end
end
