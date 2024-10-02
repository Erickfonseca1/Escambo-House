require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  subject(:ability) { Ability.new(user) }

  let(:user) { nil }

  context 'when the user is an admin' do
    let(:user) { create(:user, :admin) }

    it 'can manage all resources' do
      expect(ability).to be_able_to(:manage, :all)
    end
  end

  context 'when the user is a regular user' do
    let(:user) { create(:user) }

    it 'can read all resources' do
      expect(ability).to be_able_to(:read, :all)
    end

    it 'cannot manage all resources' do
      expect(ability).not_to be_able_to(:manage, :all)
    end

    it 'can create a Post' do
      expect(ability).to be_able_to(:create, Post)
    end

    it 'can update own Post' do
      post = create(:post, user: user)
      expect(ability).to be_able_to(:update, post)
    end

    it 'cannot update others Post' do
      post = create(:post, user: create(:user))
      expect(ability).not_to be_able_to(:update, post)
    end
  end

  context 'when the user is a guest' do
    it 'can read all resources' do
      expect(ability).to be_able_to(:read, :all)
    end

    it 'cannot create a Post' do
      expect(ability).not_to be_able_to(:create, Post)
    end
  end
end