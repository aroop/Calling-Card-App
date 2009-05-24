class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.string  :name
      t.string  :description
      t.integer :minutes
      t.decimal :price,          :precision => 10, :scale => 2
      t.integer :phones
      t.boolean :recursive
      t.timestamps
    end
  end

  def self.down
    drop_table :plans
  end
end