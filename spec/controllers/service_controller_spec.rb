require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  let(:user) { create(:user) }
  let(:service) { create(:service, user: user) }
  
  before do
    sign_in user 
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
      expect(assigns(:services)).to eq([service])
    end
  end

  describe "GET #new" do
    it "assigns a new service to @service" do
      get :new
      expect(assigns(:service)).to be_a_new(Service)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_attributes) { { service: { title: "New Service", description: "Service description", category: "Category" } } }

      it "creates a new service" do
        expect {
          post :create, params: valid_attributes
        }.to change(Service, :count).by(1)
      end

      it "redirects to the services list with a notice" do
        post :create, params: valid_attributes
        expect(response).to redirect_to(services_path)
        expect(flash[:notice]).to eq("Service was successfully created.")
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { service: { title: "", description: "", category: "" } } }

      it "does not create a service" do
        expect {
          post :create, params: invalid_attributes
        }.not_to change(Service, :count)
      end

      it "renders the new template" do
        post :create, params: invalid_attributes
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    it "assigns the requested service to @service" do
      get :edit, params: { id: service.id }
      expect(assigns(:service)).to eq(service)
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      let(:valid_attributes) { { service: { title: "Updated Service", description: "Updated description", category: "Updated category" } } }

      it "updates the requested service" do
        patch :update, params: { id: service.id, service: valid_attributes[:service] }
        service.reload
        expect(service.title).to eq("Updated Service")
      end

      it "redirects to the services list with a notice" do
        patch :update, params: { id: service.id, service: valid_attributes[:service] }
        expect(response).to redirect_to(services_path)
        expect(flash[:notice]).to eq("Serviço atualizado com sucesso.")
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { service: { title: "", description: "", category: "" } } }

      it "does not update the service" do
        patch :update, params: { id: service.id, service: invalid_attributes[:service] }
        service.reload
        expect(service.title).not_to eq("")
      end

      it "renders the edit template" do
        patch :update, params: { id: service.id, service: invalid_attributes[:service] }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the requested service" do
      service 
      expect {
        delete :destroy, params: { id: service.id }
      }.to change(Service, :count).by(-1)
    end

    it "redirects to the services list with a notice" do
      delete :destroy, params: { id: service.id }
      expect(response).to redirect_to(services_path)
      expect(flash[:notice]).to eq("Serviço excluído com sucesso.")
    end
  end
end
