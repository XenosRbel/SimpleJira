require 'rails_helper'

RSpec.describe Post, type: :model do
  subject {described_class.create}

  it 'should valid without valid attributes' do
    expect(subject).to_not be_valid
  end
end
