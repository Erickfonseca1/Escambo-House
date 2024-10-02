require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe "GET #index" do
    context "when user is logged in" do
      before do
        user = FactoryBot.create(:user)
        sign_in user
        get :index
      end

      it "returns a successful response" do
        expect(response).to be_successful
      end

      it "renders the index template" do
        expect(response).to render_template(:index)
      end
    end

    context "when user is not logged in" do
      before do
        get :index
      end

      it "redirects to the login page" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end