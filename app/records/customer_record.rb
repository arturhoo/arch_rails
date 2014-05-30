class CustomerRecord < ActiveRecord::Base
  self.table_name = 'customers'

  has_many :orders, foreign_key: 'customer_id', class_name: 'OrderRecord'
end
