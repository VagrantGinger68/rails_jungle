require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'requires a password and password confirmation to match' do
      user = User.new(first_name: "Test", last_name: "Test", email: "test@test.com", password: 'password', password_confirmation: '123456')
      expect(user.save).to be false
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'requires a password and password confirmation when creating a user' do
      user = User.new(first_name: "Test", last_name: "Test", email: "test@test.com", password: nil, password_confirmation: nil)
      expect(user.save).to be false
      expect(user.errors.full_messages).to include("Password can't be blank", "Password can't be blank", "Password is too short (minimum is 8 characters)", "Password confirmation can't be blank")
    end

    it 'requires emails to be unique and not case sensitive' do
      user1 = User.create(first_name: "User1", last_name: "User1", email: "test@test.COM", password: "password", password_confirmation: "password")
      user2 = User.new(first_name: "User2", last_name: "User2", email: "TEST@TEST.com", password: "newpassword", password_confirmation: "newpassword")
      expect(user2.save).to be false
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'requires an email' do
      user = User.new(first_name: "Test", last_name: "Test", email: nil, password: "password", password_confirmation: "password")
      expect(user.save).to be false
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'requires a first name' do
      user = User.new(first_name: nil, last_name: "Test", email: "test@test.com", password: "password", password_confirmation: "password")
      expect(user.save).to be false
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'requires a last name' do
      user = User.new(first_name: "Test", last_name: nil, email: "test@test.com", password: "password", password_confirmation: "password")
      expect(user.save).to be false
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'requires a password with a minimum length of 8 characters' do
      user = User.new(first_name: "Test", last_name: "Test", email: "test@test.com", password: "1234", password_confirmation: "1234")
      expect(user.save).to be false
      expect(user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")

      user2 = User.new(first_name: "Test", last_name: "Test", email: "test@test.com", password: "12345678", password_confirmation: "12345678")
      expect(user2.save).to be true
    end

  end

  describe '.authenticate_with_credentials' do

    before do
      User.create(first_name: "Test", last_name: "Test", email: "test@test.com", password: "password", password_confirmation: "password")
    end


    it 'authenticates a user with valid credentials' do
      authenticated_user = User.authenticate_with_credentials("test@test.com", "password")
      expect(authenticated_user).to be_an_instance_of(User)
    end

    it "returns nil if email doesn't exist" do
      authenticated_user = User.authenticate_with_credentials("NoEmail@test.com", "password")
      expect(authenticated_user).to be_nil
    end

    it 'returns nil with wrong password' do
      authenticated_user = User.authenticate_with_credentials("test@test.com", "12345678")
      expect(authenticated_user).to be_nil
    end

    it 'removes spaces before and after email' do
      authenticated_user = User.authenticate_with_credentials(" test@test.com ", "password")
      expect(authenticated_user).to be_an_instance_of(User)
    end

    it 'authenticates if user types in wrong case' do
      authenticated_user = User.authenticate_with_credentials("TeSt@tEsT.com", "password")
      expect(authenticated_user).to be_an_instance_of(User)
    end
  end

end
