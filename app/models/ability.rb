# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Usuário não logado (guest) pode apenas ver a vitrine de serviços (marketplace)
    if user.nil?
      can :read, Service
    else
      # Usuário comum pode criar serviços e gerenciar suas próprias trocas
      can :manage, Service, user_id: user.id
      can :manage, Exchange, requester_id: user.id


      # Caso o usuário seja admin, ele tem controle total
      if user.admin?
        can :manage, :all
      end
    end
  end
end
