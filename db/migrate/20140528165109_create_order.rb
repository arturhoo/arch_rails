class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :value
      t.references :customer, index: true
    end
  end
end
