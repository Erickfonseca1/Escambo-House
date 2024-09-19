class Service < ApplicationRecord
  belongs_to :user

  CATEGORIES = [
    "Manutenção Residencial",
    "Serviços Domésticos",
    "Culinária e Alimentação",
    "Cuidados Pessoais",
    "Educação e Tutoria",
    "Transporte e Entrega",
    "Assistência Técnica",
    "Jardinagem e Paisagismo",
    "Fitness e Bem-Estar",
    "Pet Care",
    "Artesanato e Criações",
    "Consultoria e Administração"
  ]
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
