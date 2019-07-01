require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'should valid with valid attributes' do
    subject = FactoryBot.create(:project)
    
    expect(subject).to be_valid
  end
  
  it 'should valid without valid date' do
    subject = FactoryBot.create(:project)
    subject.start_date = '01.07.2019'
    subject.end_date = '01.06.2019'
    
    expect(subject).to_not be_valid
  end
end
