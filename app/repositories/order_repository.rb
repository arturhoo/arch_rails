class OrderRepository
  def all
    OrderRecord.all.map { |o| Order.new(o.attributes) }
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

