require 'rails_helper'

RSpec.describe MarketplaceServicesController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:service) { create(:service, user: other_user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @services" do
      get :index
      expect(assigns(:services)).to eq([service])
    end

    it "does not include services from the current user" do
      own_service = create(:service, user: user)
      get :index
      expect(assigns(:services)).not_to include(own_service)
    end

    it "paginates the services" do
      create_list(:service, 15, user: other_user)
      get :index, params: { page: 2 }
      expect(assigns(:services).count).to eq(6) # Assuming per(9) and 15 + 1 existing service
    end
  end
end