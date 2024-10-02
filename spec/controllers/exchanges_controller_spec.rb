require 'rails_helper'

RSpec.describe ExchangesController, type: :controller do
  let(:valid_attributes) {
    { attribute1: 'value1', attribute2: 'value2' }
  }

  let(:invalid_attributes) {
    { attribute1: nil, attribute2: 'value2' }
  }

  describe "GET #index" do
    it "returns a success response" do
      Exchange.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      exchange = Exchange.create! valid_attributes
      get :show, params: { id: exchange.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Exchange" do
        expect {
          post :create, params: { exchange: valid_attributes }
        }.to change(Exchange, :count).by(1)
      end

      it "redirects to the created exchange" do
        post :create, params: { exchange: valid_attributes }
        expect(response).to redirect_to(Exchange.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { exchange: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { attribute1: 'new_value1', attribute2: 'new_value2' }
      }

      it "updates the requested exchange" do
        exchange = Exchange.create! valid_attributes
        put :update, params: { id: exchange.to_param, exchange: new_attributes }
        exchange.reload
        expect(exchange.attribute1).to eq('new_value1')
      end

      it "redirects to the exchange" do
        exchange = Exchange.create! valid_attributes
        put :update, params: { id: exchange.to_param, exchange: valid_attributes }
        expect(response).to redirect_to(exchange)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        exchange = Exchange.create! valid_attributes
        put :update, params: { id: exchange.to_param, exchange: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested exchange" do
      exchange = Exchange.create! valid_attributes
      expect {
        delete :destroy, params: { id: exchange.to_param }
      }.to change(Exchange, :count).by(-1)
    end

    it "redirects to the exchanges list" do
      exchange = Exchange.create! valid_attributes
      delete :destroy, params: { id: exchange.to_param }
      expect(response).to redirect_to(exchanges_url)
    end
  end
end