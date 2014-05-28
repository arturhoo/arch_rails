class Parent
  include ActiveAttr::Model

  attribute :name
  attribute :email

  validates :name, presence: true
  validates :email, presence: true
end
