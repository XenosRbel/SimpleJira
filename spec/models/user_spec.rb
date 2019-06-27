require 'rails_helper'

RSpec.describe User, type: :model do
  subject {described_class.create}

  it 'should valid with valid attributes' do
    subject.id = 1
    subject.email = 'user1@user.user'
    subject.first_name = 'First Name of user'
    subject.last_name = 'Last Name of user'
    subject.admin = :User
    subject.password = '1234567890'

    expect(subject).to be_valid
  end

  it 'should valid with password equal 6 symbol' do
    subject.id = 1
    subject.email = 'user1@user.user'
    subject.first_name = 'First Name of user'
    subject.last_name = 'Last Name of user'
    subject.admin = :User
    subject.password = '123456'

    expect(subject).to be_valid
  end

  it 'should valid with password less 6 symbol' do
    subject.id = 1
    subject.email = 'user1@user.user'
    subject.first_name = 'First Name of user'
    subject.last_name = 'Last Name of user'
    subject.admin = :User
    subject.password = '12345'

    expect(subject).to_not be_valid
  end
end
