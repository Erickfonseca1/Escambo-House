class ExchangesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_exchange, only: [ :edit, :update, :destroy ]

  def index
    @exchanges = Exchange.where(requester: current_user).or(Exchange.where(owner: current_user))
  end

  def new
    @exchange = Exchange.new
    # Certifique-se de que estamos definindo os serviços do usuário atual
    @services = current_user.services

    # Pré-seleciona o serviço solicitado, se passado pela URL
    if params[:service_requested_id]
      @service_requested = Service.find(params[:service_requested_id])
    end
  end

  def create
    @exchange = Exchange.new(exchange_params)
    @exchange.requester = current_user
    @exchange.status = "pending"
    if @exchange.save
      redirect_to exchanges_path, notice: "Exchange was successfully created."
    else
      render :new
    end
  end

  def edit
    @services = current_user.services
  end

  def update
    if @exchange.update(status: params[:status])
      redirect_to exchanges_path, notice: "Exchange status was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @exchange.destroy
    redirect_to exchanges_path, notice: "Troca excluída com sucesso."
  end

  private
  def exchange_params
    params.require(:exchange).permit(:service_offered_id, :service_requested_id, :owner_id)
  end

  def set_exchange
    @exchange = Exchange.find(params[:id])
  end
end
