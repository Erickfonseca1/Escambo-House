class User < ApplicationRecord
  has_many :services
  has_many :exchanges_as_owner, class_name: "Exchange", foreign_key: "owner_id"
  has_many :exchanges_as_requester, class_name: "Exchange", foreign_key: "requester_id"

  attribute :admin, :boolean, default: false
  validates :name, presence: true
  validates :address, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
