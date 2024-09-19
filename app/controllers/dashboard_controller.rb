class DashboardController < ApplicationController
  before_action :authenticate_user!  # Garante que só usuários logados possam acessar

  def index
  end
end
