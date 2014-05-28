class CreateParent < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :name
      t.string :email
    end
  end
end
