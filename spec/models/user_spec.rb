require 'rails_helper'

RSpec.describe User, type: :model do
  subject {User.new(first_name: 'Jack', last_name: 'Gangster', email: 'myem@il.com', password: 'password123', password_confirmation: 'password123')}

  describe 'Validations' do
    it 'validates user credentials' do
      user = subject

      expect(user).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'authenticates an invalid user' do
      subject.save!
      user_dummy = User.authenticate_with_credentials('', '')
      
      expect(user_dummy).to be_nil
    end

    # it "authenticates user's email with spaces" do
    #   subject.save!
    #   user_dummy = User.authenticate_with_credentials('myem@il.com', 'password123')
    #   # puts user_dummy.errors.full_messagesx 
    #   expect(user_dummy).to be_valid
    # end

    # it 'authenticates user regardless uppercase email' do
    #   subject.save!
    #   user_dummy = User.authenticate_with_credentials('MYem@il.com', 'password123')
      
    #   expect(user_dummy).to be_valid
    # end
  end
end