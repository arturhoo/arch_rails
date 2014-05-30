class Customer
  include ActiveAttr::Model

  attribute :id
  attribute :name
  attribute :email
  attribute :orders, default: []

  validates :name, presence: true
  validates :email, presence: true
end
