class ParentRepository
  def all
    ParentRecord.all.map { |p| Parent.new(p.attributes) }
  end

  def add(parent)
    fail 'invalid parent' unless parent.valid?
    ar_parent = ParentRecord.create(parent.attributes)
    parent.id = ar_parent.id
    parent
  end

  def find_by_id(id)
    ar_parent = ParentRecord.find(id)
    Parent.new(ar_parent.attributes)
  end
end

class ParentRecord < ActiveRecord::Base
  self.table_name = 'parents'
end
