class Exchange < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :requester, class_name: "User"
  belongs_to :service_offered, class_name: "Service"
  belongs_to :service_requested, class_name: "Service"

  validates :status, inclusion: { in: %w[pending accepted rejected], message: "%{value} não é um status válido" }
end
