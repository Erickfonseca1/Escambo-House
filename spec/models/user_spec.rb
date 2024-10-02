require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:services) }
    it { should have_many(:exchanges_as_owner).class_name('Exchange').with_foreign_key('owner_id') }
    it { should have_many(:exchanges_as_requester).class_name('Exchange').with_foreign_key('requester_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
  end

  describe 'attributes' do
    it 'should have admin attribute with default value false' do
      user = User.new
      expect(user.admin).to be_falsey
    end
  end

  describe 'devise modules' do
    it 'should include database_authenticatable' do
      expect(User.devise_modules).to include(:database_authenticatable)
    end

    it 'should include registerable' do
      expect(User.devise_modules).to include(:registerable)
    end

    it 'should include recoverable' do
      expect(User.devise_modules).to include(:recoverable)
    end

    it 'should include rememberable' do
      expect(User.devise_modules).to include(:rememberable)
    end

    it 'should include validatable' do
      expect(User.devise_modules).to include(:validatable)
    end
  end
end