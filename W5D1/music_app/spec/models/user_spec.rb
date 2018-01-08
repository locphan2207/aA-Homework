require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'validations' do
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password_digest)}
    it { should validate_length_of(:password).is_at_least(6)}
  end
  
  subject(:user) { User.new(email: 'loc@gmail.com', password: 'chetcha')}
  
  describe '#is_password?' do 
    it 'should return true on correct password' do
      expect(user.is_password?('chetcha')).to eq(true)
    end
    
    it 'should return true on correct password' do
      expect(user.is_password?('jfklsa;fjlksa')).to eq(false)
    end
  end
  
  describe '#reset_session_token' do
    it 'should have different session_token from the previous one' do 
      previous_session_token = user.session_token
      expect(user.reset_session_token!).not_to eq(previous_session_token)
    end
  end
  
  describe '::find_by_credentials' do
    it 'should look up and return the correct user' do 
      user.save
      expect(User.find_by_credentials('loc@gmail.com', 'chetcha')).to eq(user)
    end
    
    it 'should return nil if cannot find the user' do
      user.save
      expect(User.find_by_credentials('loc@gmail.com', '23dafdsa')).to eq(nil)
    end
  end
end
