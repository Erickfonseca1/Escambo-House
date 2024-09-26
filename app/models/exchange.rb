class Exchange < ApplicationRecord
  belongs_to :service_offered, class_name: 'Service', foreign_key: 'service_offered_id'
  belongs_to :service_requested, class_name: 'Service', foreign_key: 'service_requested_id'
  belongs_to :requester, class_name: 'User', foreign_key: 'requester_id'
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :service_offered, presence: true
  validates :service_requested, presence: true
  validates :status, presence: true
  validates :description, presence: true
end