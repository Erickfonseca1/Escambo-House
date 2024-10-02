require 'rails_helper'

RSpec.describe ApplicationMailer, type: :mailer do
  describe 'default settings' do
    it 'sets the default from email' do
      expect(ApplicationMailer.default[:from]).to eq('from@example.com')
    end
  end

  describe 'welcome_email' do
    let(:user) { create(:user, email: 'test@example.com') }
    let(:mail) { ApplicationMailer.welcome_email(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome to My Awesome Site')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Welcome to My Awesome Site, #{user.name}')
    end
  end

  describe 'notification_email' do
    let(:user) { create(:user, email: 'test@example.com') }
    let(:mail) { ApplicationMailer.notification_email(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Notification')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('You have a new notification')
    end
  end
end