class Order
  include ActiveAttr::Model

  attribute :id
  attribute :value, type: Integer
  attribute :customer_id, type: Integer

  validates :value, presence: true
  validates :customer_id, presence: true
end
