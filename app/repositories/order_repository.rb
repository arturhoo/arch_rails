class OrderRepository
  def all
  end

  def add(order)
    fail 'invalid order' unless order.valid?
    ar_order = OrderRecord.create(order.attributes)
    order.id = ar_order.id
    order
  end

  def find_by_id(id)
    ar_order = OrderRecord.find(id)
    Order.new(ar_order.attributes)
  end
end

class OrderRecord < ActiveRecord::Base
  self.table_name = 'orders'
end
