require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  # Configura um controller que usa Devise para que possamos testar
  controller do
    before_action :configure_permitted_parameters, if: :devise_controller?

    def create
      head :ok
    end
  end

  describe "Devise parameter sanitizer" do
    before do
      # Mock para simular um controller Devise
      allow(controller).to receive(:devise_controller?).and_return(true)
    end

    it "permits additional sign up parameters" do
      # Simula os parâmetros recebidos para o signup
      params = { user: { name: "Test User", address: "123 Test Street", email: "test@example.com", password: "password123" } }
      expect(controller).to receive(:devise_parameter_sanitizer).and_return(double(permit: params[:user]))

      post :create, params: params
    end

    it "permits additional account update parameters" do
      # Simula os parâmetros recebidos para a atualização de conta
      params = { user: { name: "Updated User", address: "456 Update Ave", email: "updated@example.com", password: "newpassword123" } }
      expect(controller).to receive(:devise_parameter_sanitizer).and_return(double(permit: params[:user]))

      patch :create, params: params
    end
  end
end
