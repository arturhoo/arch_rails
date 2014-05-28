class CustomerRepository
  def all
    CustomerRecord.all.map { |p| Customer.new(p.attributes) }
  end

  def add(customer)
    fail 'invalid customer' unless customer.valid?
    ar_customer = CustomerRecord.create(customer.attributes)
    customer.id = ar_customer.id
    customer
  end

  def find_by_id(id)
    ar_customer = CustomerRecord.find(id)
    Customer.new(ar_customer.attributes)
  end
end
