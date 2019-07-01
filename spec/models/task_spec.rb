require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'should valid with valid attributes' do
    subject = FactoryBot.create(:task)
    
    expect(subject).to be_valid
  end
  
  it 'should valid without valid date' do
    subject = FactoryBot.create(:task)
    subject.start_date = '01.07.2019'
    subject.due_date = '01.0.2019'
    
    expect(subject).to_not be_valid
  end
end
