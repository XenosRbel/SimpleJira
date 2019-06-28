require 'rails_helper'

RSpec.describe Post, type: :model do
	subject do
		described_class.create
	end

  it 'should valid without valid attributes' do
    expect(subject).to_not be_valid
  end
end
