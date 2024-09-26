class MarketplaceServicesController < ApplicationController
  before_action :authenticate_user!  # Garante que só usuários logados possam acessar
  def index
    @services = Service.where.not(user: current_user).page(params[:page]).per(9)
  end
end
