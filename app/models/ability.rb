# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Permissões para usuários logados
    if user.present?
      # O usuário pode criar e gerenciar os próprios serviços
      can :manage, Service, user_id: user.id

      # O usuário pode gerenciar trocas que ele solicitou
      can :manage, Exchange, requester_id: user.id

      # O usuário pode editar apenas as trocas que foram solicitadas a ele
      can [ :edit, :update ], Exchange, owner_id: user.id

      # Caso o usuário seja admin, ele pode gerenciar tudo
      if user.admin?
        can :manage, :all
      end
    else
      # Usuários não logados podem apenas ler serviços
      can :read, Service
    end
  end
end
