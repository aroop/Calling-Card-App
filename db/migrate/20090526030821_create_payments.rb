class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.references  :subscription
      t.references  :user
      t.decimal     :amount,          :precision => 10, :scale => 2, :default => 0.0
      t.string      :transaction_id
      t.string      :action
      t.string      :message
      t.boolean     :success
      t.text        :params
      t.boolean     :test
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end