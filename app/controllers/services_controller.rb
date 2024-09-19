class ServicesController < ApplicationController
  load_and_authorize_resource

  def index
    # @services = Service.all
    @services = current_user.services
  end

  def new
    @service = Service.new
  end

  def create
    @service = current_user.services.build(service_params)
    if @service.save
      redirect_to services_path, notice: "Service was successfully created."
    else
      render :new
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to services_path, notice: "Serviço atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path, notice: "Serviço excluído com sucesso."
  end

  private

  def service_params
    params.require(:service).permit(:title, :description, :category)
  end
end
