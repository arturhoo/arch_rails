class CustomerRepository
  def all
    CustomerRecord.all.map { |c| instantiate_customer c }
  end

  def add(customer)
    fail 'invalid customer' unless customer.valid?
    ar_customer = CustomerRecord.create customer.attributes
    customer.id = ar_customer.id
    customer
  end

  def find_by_id(id)
    ar_customer = CustomerRecord.find id
    instantiate_customer ar_customer
  end

  private

  def instantiate_customer(ar_customer)
    c = Customer.new ar_customer.attributes
    associations = CustomerRecord.reflect_on_all_associations(:has_many).map(&:name)
    associations.each do |a|
      children = ar_customer.send a
      children.each do |child|
        klass = child.class.to_s[0..-7]
        c.send(a) << Object.const_get(klass).new(child.attributes)
      end
    end
    return c
  end
end
