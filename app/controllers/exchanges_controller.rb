class ExchangesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_exchange, only: [ :edit, :update, :destroy ]

  def index
    @requested_exchanges = current_user.exchanges_as_requester.page(params[:page]).per(10)

    @received_exchanges = Exchange.where(owner_id: current_user.id).page(params[:page]).per(10)
  end

  def new
    @exchange = Exchange.new
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
  
    logger.info "Exchange Params: #{exchange_params}"  # Logando os parâmetros para verificação
    logger.info "Exchange requester: #{@exchange.requester.id}"  # Verificando o solicitante
  
    if @exchange.save
      redirect_to exchanges_path, notice: "Troca criada com sucesso."
    else
      logger.error "Erro ao salvar troca: #{@exchange.errors.full_messages}" # Exibindo as mensagens de erro
      @services = current_user.services
      render :new
    end
  end

  def edit
    @services = current_user.services
  end

  def update
    if @exchange.update(exchange_params)
      redirect_to exchanges_path, notice: 'Troca atualizada com sucesso.'
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
    params.require(:exchange).permit(:service_offered_id, :service_requested_id, :owner_id, :status, :description)
  end

  def set_exchange
    @exchange = Exchange.find(params[:id])
  end
end
