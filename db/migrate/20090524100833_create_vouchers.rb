class CreateVouchers < ActiveRecord::Migration
  def self.up
    create_table :vouchers do |t|
      t.decimal     :amount,                   :precision => 10, :scale => 2
      t.datetime    :next_renewal_at
      t.references  :user
      t.references  :plan
      t.integer     :id
      t.timestamps
    end
  end

  def self.down
    drop_table :vouchers
  end
end
