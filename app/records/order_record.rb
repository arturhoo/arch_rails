class OrderRecord < ActiveRecord::Base
  self.table_name = 'orders'

  belongs_to :customer, class_name: 'CustomerRecord'
end
